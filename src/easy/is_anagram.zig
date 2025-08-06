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

test "no matches" {
    const expected = [_][]const u8{};
    const word = "diaper";
    const candidates = [_][]const u8{ "hello", "world", "zombies", "pants" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects two anagrams" {
    const expected = [_][]const u8{ "lemons", "melons" };
    const word = "solemn";
    const candidates = [_][]const u8{ "lemons", "cherry", "melons" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "does not detect anagram subsets" {
    const expected = [_][]const u8{};
    const word = "good";
    const candidates = [_][]const u8{ "dog", "goody" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects anagram" {
    const expected = [_][]const u8{"inlets"};
    const word = "listen";
    const candidates = [_][]const u8{ "enlists", "google", "inlets", "banana" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects three anagrams" {
    const expected = [_][]const u8{ "gallery", "regally", "largely" };
    const word = "allergy";
    const candidates = [_][]const u8{ "gallery", "ballerina", "regally", "clergy", "largely", "leading" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects multiple anagrams with different case" {
    const expected = [_][]const u8{ "Eons", "ONES" };
    const word = "nose";
    const candidates = [_][]const u8{ "Eons", "ONES" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "does not detect non-anagrams with identical checksum" {
    const expected = [_][]const u8{};
    const word = "mass";
    const candidates = [_][]const u8{"last"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects anagrams case-insensitively" {
    const expected = [_][]const u8{"Carthorse"};
    const word = "Orchestra";
    const candidates = [_][]const u8{ "cashregister", "Carthorse", "radishes" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects anagrams using case-insensitive subject" {
    const expected = [_][]const u8{"carthorse"};
    const word = "Orchestra";
    const candidates = [_][]const u8{ "cashregister", "carthorse", "radishes" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "detects anagrams using case-insensitive possible matches" {
    const expected = [_][]const u8{"Carthorse"};
    const word = "orchestra";
    const candidates = [_][]const u8{ "cashregister", "Carthorse", "radishes" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "does not detect an anagram if the original word is repeated" {
    const expected = [_][]const u8{};
    const word = "go";
    const candidates = [_][]const u8{"goGoGO"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "anagrams must use all letters exactly once" {
    const expected = [_][]const u8{};
    const word = "tapper";
    const candidates = [_][]const u8{"patter"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "words are not anagrams of themselves" {
    const expected = [_][]const u8{};
    const word = "BANANA";
    const candidates = [_][]const u8{"BANANA"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "words are not anagrams of themselves even if letter case is partially different" {
    const expected = [_][]const u8{};
    const word = "BANANA";
    const candidates = [_][]const u8{"Banana"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "words are not anagrams of themselves even if letter case is completely different" {
    const expected = [_][]const u8{};
    const word = "BANANA";
    const candidates = [_][]const u8{"banana"};
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
}

test "words other than themselves can be anagrams" {
    const expected = [_][]const u8{"Silent"};
    const word = "LISTEN";
    const candidates = [_][]const u8{ "LISTEN", "Silent" };
    const allocator = std.testing.allocator;
    const result = detectAnagrams(allocator, word, &candidates);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([]const u8, &expected, actual);
    } else return error.SkipZigTest;
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
