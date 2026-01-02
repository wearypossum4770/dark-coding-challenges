const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn rotateString(allocator: Allocator, s: []const u8, goal: []const u8) ?bool {
    if (s.len != goal.len) return false;
    if (s.len == 0 or goal.len == 0) return true;
    var slices = [_][]const u8{ s, s };
    const result = std.mem.concat(allocator, u8, &slices) catch return null;
    defer allocator.free(result);
    return std.mem.containsAtLeast(u8, result, 1, goal);
}

test "the string abcde can be made by rotating cdeab" {
    const s = "abcde";
    const goal = "cdeab";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcde can be made by rotating eabcd" {
    const s = "abcde";
    const goal = "eabcd";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcde can be made by rotating abcde" {
    const s = "abcde";
    const goal = "abcde";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcde can be made by rotating abced" {
    const s = "abcde";
    const goal = "abced";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcde can be made by rotating edcba" {
    const s = "abcde";
    const goal = "edcba";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string aa can be made by rotating a" {
    const s = "aa";
    const goal = "a";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string a can be made by rotating aa" {
    const s = "a";
    const goal = "aa";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abc can be made by rotating abcd" {
    const s = "abc";
    const goal = "abcd";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string aaaa can be made by rotating aaaa" {
    const s = "aaaa";
    const goal = "aaaa";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string aabb can be made by rotating bbaa" {
    const s = "aabb";
    const goal = "bbaa";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string aabb can be made by rotating abab" {
    const s = "aabb";
    const goal = "abab";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string aabb can be made by rotating abba" {
    const s = "aabb";
    const goal = "abba";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string defdefdefabcabc can be made by rotating defdefabcabcdef" {
    const s = "defdefdefabcabc";
    const goal = "defdefabcabcdef";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string bbbacddceeb can be made by rotating ceebbbbacdd" {
    const s = "bbbacddceeb";
    const goal = "ceebbbbacdd";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string 'a' can be made by rotating 'a'" {
    const s = "a";
    const goal = "a";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string a can be made by rotating b" {
    const s = "a";
    const goal = "b";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "empty strings are rotations of each other" {
    const s = "";
    const goal = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcabc can be made by rotating bcabca" {
    const s = "abcabc";
    const goal = "bcabca";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the string abcabc can be made by rotating cabacb" {
    const s = "abcabc";
    const goal = "cabacb";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = rotateString(allocator, s, goal);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
