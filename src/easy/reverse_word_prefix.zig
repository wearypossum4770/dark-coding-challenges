const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const Allocator = std.mem.Allocator;

pub fn reverseWordPrefix(allocator: Allocator, word: []const u8, ch: u8) ?[]const u8 {
    var result = allocator.alloc(u8, word.len) catch return null;
    for (word, 0..) |char, i| {
        if (char == ch) {
            var index: usize = 0;
            var left = i + 1;
            var right = i + 1;
            while (left > 0) {
                left -= 1;
                result[index] = word[left];
                index += 1;
            }
            while (right < word.len) {
                result[index] = word[right];
                right += 1;
                index += 1;
            }
            return result;
        }
    }
    defer allocator.free(result);
    return allocator.dupe(u8, word) catch return null;
}

test "odd occurrence of abcdefd" {
    const word = "abcdefd";
    const allocator = std.testing.allocator;
    const char: u8 = 'd';
    const expected = "dcbaefd";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of xyxzxe" {
    const word = "xyxzxe";
    const allocator = std.testing.allocator;
    const char: u8 = 'z';
    const expected = "zxyxxe";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcd" {
    const word = "abcd";
    const allocator = std.testing.allocator;
    const char: u8 = 'z';
    const expected = "abcd";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcde" {
    const word = "abcde";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "abcde";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of aabcd" {
    const word = "aabcd";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "aabcd";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcde with e" {
    const word = "abcde";
    const allocator = std.testing.allocator;
    const char: u8 = 'e';
    const expected = "edcba";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of a with a" {
    const word = "a";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "a";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of a with b" {
    const word = "a";
    const allocator = std.testing.allocator;
    const char: u8 = 'b';
    const expected = "a";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of aabcaad" {
    const word = "aabcaad";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "aabcaad";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abacaba" {
    const word = "abacaba";
    const allocator = std.testing.allocator;
    const char: u8 = 'c';
    const expected = "cabaaba";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcdabcd" {
    const word = "abcdabcd";
    const allocator = std.testing.allocator;
    const char: u8 = 'd';
    const expected = "dcbaabcd";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of dcba" {
    const word = "dcba";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "abcd";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of ba" {
    const word = "ba";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "ab";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of aaaa with a" {
    const word = "aaaa";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "aaaa";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of aaaa with b" {
    const word = "aaaa";
    const allocator = std.testing.allocator;
    const char: u8 = 'b';
    const expected = "aaaa";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcde with b" {
    const word = "abcde";
    const allocator = std.testing.allocator;
    const char: u8 = 'b';
    const expected = "bacde";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of abcde with d" {
    const word = "abcde";
    const allocator = std.testing.allocator;
    const char: u8 = 'd';
    const expected = "dcbae";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of ab with a" {
    const word = "ab";
    const allocator = std.testing.allocator;
    const char: u8 = 'a';
    const expected = "ab";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of ab with b" {
    const word = "ab";
    const allocator = std.testing.allocator;
    const char: u8 = 'b';
    const expected = "ba";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of ab with z" {
    const word = "ab";
    const allocator = std.testing.allocator;
    const char: u8 = 'z';
    const expected = "ab";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of racecar with e" {
    const word = "racecar";
    const allocator = std.testing.allocator;
    const char: u8 = 'e';
    const expected = "ecarcar";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of racecar with r" {
    const word = "racecar";
    const allocator = std.testing.allocator;
    const char: u8 = 'r';
    const expected = "racecar";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of aabba" {
    const word = "aabba";
    const allocator = std.testing.allocator;
    const char: u8 = 'b';
    const expected = "baaba";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}

test "odd occurrence of mnopqrstu" {
    const word = "mnopqrstu";
    const allocator = std.testing.allocator;
    const char: u8 = 'u';
    const expected = "utsrqponm";
    const result = reverseWordPrefix(allocator, word, char);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
