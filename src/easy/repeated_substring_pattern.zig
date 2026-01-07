const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn repeatedSubstringPattern(allocator: Allocator, s: []const u8) ?bool {
    var slices = [_][]const u8{ s, s };
    const result = std.mem.concat(allocator, u8, &slices) catch return null;
    defer allocator.free(result);
    return std.mem.containsAtLeast(u8, result[1 .. s.len * 2 - 1], 1, s);
}

test "substrings can create a" {
    const s = "a";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create aa" {
    const s = "aa";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create ab" {
    const s = "ab";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create aba" {
    const s = "aba";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abab" {
    const s = "abab";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create ababba" {
    const s = "ababba";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abcabc" {
    const s = "abcabc";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abcabcabcabc" {
    const s = "abcabcabcabc";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abcdabcd" {
    const s = "abcdabcd";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abcdabce" {
    const s = "abcdabce";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create aaaaaaaa" {
    const s = "aaaaaaaa";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create aaaaaaab" {
    const s = "aaaaaaab";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abaababaab" {
    const s = "abaababaab";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abaaba" {
    const s = "abaaba";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create abaabab" {
    const s = "abaabab";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create xyzxyzxyz" {
    const s = "xyzxyzxyz";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create xyzxy" {
    const s = "xyzxy";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create zz" {
    const s = "zz";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create z" {
    const s = "z";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "substrings can create ababababx" {
    const s = "ababababx";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = repeatedSubstringPattern(allocator, s);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
