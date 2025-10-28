const std = @import("std");
const expectEqualStrings = std.testing.expectEqualStrings;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;
const IterTools = @import("./itertools.zig");
const isVowel = IterTools.isVowel;

pub fn reverseVowels(allocator: Allocator, s: []const u8) ?[]const u8 {
    var result = allocator.alloc(u8, s.len) catch return null;
    if (s.len < 2) {
        std.mem.copyBackwards(u8, result, s);
        return result;
    }
    var left: usize = 0;
    var right = s.len - 1;
    while (left <= right) {
        if (!isVowel(s[left])) {
            result[left] = s[left];
            left += 1;
        } else if (!isVowel(s[right])) {
            result[right] = s[right];
            right -= 1;
        } else {
            result[right] = s[left];
            result[left] = s[right];
            right -= 1;
            left += 1;
        }
    }
    return result;
}

test "reverse the vowels of IceCreAm" {
    const s = "IceCreAm";
    const expected = "AceCreIm";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of leetcode" {
    const s = "leetcode";
    const expected = "leotcede";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of a" {
    const s = "a";
    const expected = "a";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of b" {
    const s = "b";
    const expected = "b";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of AEIOU" {
    const s = "AEIOU";
    const expected = "UOIEA";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of aeiou" {
    const s = "aeiou";
    const expected = "uoiea";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of bcdfgh" {
    const s = "bcdfgh";
    const expected = "bcdfgh";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of aA" {
    const s = "aA";
    const expected = "Aa";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of a.b,e" {
    const s = "a.b,e";
    const expected = "e.b,a";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of hello world" {
    const s = "hello world";
    const expected = "hollo werld";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of aEiOu" {
    const s = "aEiOu";
    const expected = "uOiEa";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of .,?!" {
    const s = ".,?!";
    const expected = ".,?!";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of aaaaaa" {
    const s = "aaaaaa";
    const expected = "aaaaaa";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "reverse the vowels of aAaaAa" {
    const s = "aAaaAa";
    const expected = "aAaaAa";
    const allocator = std.testing.allocator;
    const result = reverseVowels(allocator, s);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
