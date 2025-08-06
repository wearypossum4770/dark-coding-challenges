const std = @import("std");
const TextTools = @import("text_tools.zig");

const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const safeGet = TextTools.safeGet;
const safelyDecrement = TextTools.safelyDecrement;
const Allocator = std.mem.Allocator;

pub fn isAnagram(first: []const u8, second: []const u8) bool {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var frequencyOptional = TextTools.countCharacters(u8, allocator, first);

    if (frequencyOptional) |*frequency| {
        for (second) |char| {
            if (safeGet(u8, char, frequency) > 0) {
                _ = safelyDecrement(u8, char, frequency);
            } else return false;
        }
        var iter = frequency.iterator();
        while (iter.next()) |entry| {
            if (entry.value_ptr.* != 0) return false;
        }
    }
    return true;
}

pub fn detectAnagrams(allocator: Allocator, word: []const u8, candidates: []const []const u8) ?[][]const u8 {
    const lowerWord = TextTools.toLowerCase(allocator, word) orelse "";
    var valid = std.ArrayList([]const u8).init(allocator);
    defer {
        valid.deinit();
        allocator.free(lowerWord);
    }

    for (candidates) |candidate| {
        const lowerCandidate = TextTools.toLowerCase(allocator, candidate) orelse "";
        defer allocator.free(lowerCandidate);
        if (!std.mem.eql(u8, lowerCandidate, lowerWord) and isAnagram(lowerWord, lowerCandidate)) {
            valid.append(candidate) catch return null;
        }
    }
    return valid.toOwnedSlice() catch return null;
}

test "perfect anagram with all matching characters" {
    const first = "anagram";
    const second = "nagaram";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "perfect anagram with all unique characters" {
    const first = "listen";
    const second = "silent";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "perfect anagram with long word" {
    const first = "triangle";
    const second = "integral";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "partial overlap but not anagram" {
    const first = "apple";
    const second = "pale";
    const actual = isAnagram(first, second);
    try expectEqual(false, actual);
}

test "same letters different frequencies is not anagram" {
    const first = "aacc";
    const second = "ccac";
    const actual = isAnagram(first, second);
    try expectEqual(false, actual);
}

test "empty strings are valid anagrams" {
    const first = "";
    const second = "";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "single character match" {
    const first = "a";
    const second = "a";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "single character mismatch" {
    const first = "a";
    const second = "b";
    const actual = isAnagram(first, second);
    try expectEqual(false, actual);
}

test "identical repeated characters" {
    const first = "aaaaa";
    const second = "aaaaa";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}

test "same characters in different order" {
    const first = "abcd";
    const second = "abdc";
    const actual = isAnagram(first, second);
    try expectEqual(true, actual);
}
