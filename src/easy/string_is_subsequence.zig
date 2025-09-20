const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn stringIsSubsequence(s: []const u8, t: []const u8) bool {
    var left: usize = 0;
    var right: usize = 0;
    while (left < s.len and right < t.len) {
        if (s[left] == t[right]) {
            left += 1;
        }
        right += 1;
    }
    return left == s.len;
}

test "if abc is a subsequence of ahbgdc" {
    const s = "abc";
    const t = "ahbgdc";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if  is a subsequence of " {
    const s = "";
    const t = "";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if  is a subsequence of anything" {
    const s = "";
    const t = "anything";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if a is a subsequence of a" {
    const s = "a";
    const t = "a";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if a is a subsequence of b" {
    const s = "a";
    const t = "b";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if z is a subsequence of abc" {
    const s = "z";
    const t = "abc";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if acb is a subsequence of abc" {
    const s = "acb";
    const t = "abc";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if xyz is a subsequence of abcxyz" {
    const s = "xyz";
    const t = "abcxyz";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if aaa is a subsequence of aaaaaa" {
    const s = "aaa";
    const t = "aaaaaa";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if aaa is a subsequence of aa" {
    const s = "aaa";
    const t = "aa";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if abc is a subsequence of abc" {
    const s = "abc";
    const t = "abc";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if ace is a subsequence of abcde" {
    const s = "ace";
    const t = "abcde";
    const expected = true;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if aec is a subsequence of abcde" {
    const s = "aec";
    const t = "abcde";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}

test "if axc is a subsequence of ahbgdc" {
    const s = "axc";
    const t = "ahbgdc";
    const expected = false;
    const actual = stringIsSubsequence(s, t);
    try expectEqual(expected, actual);
}
