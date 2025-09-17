const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const TextTools = @import("text_tools.zig");
const countCharacters = TextTools.countCharacters;
const safeGet = TextTools.safeGet;
const safelyDecrement = TextTools.safelyDecrement;
const toLower = std.ascii.toLower;

pub fn canConstructRansomNote(allocator: Allocator, ransomNote: []const u8, magazine: []const u8) ?bool {
    var freq = countCharacters(u8, allocator, magazine) orelse return null;
    defer freq.deinit();
    for (ransomNote) |char| {
        const count = safeGet(u8, toLower(char), &freq);
        if (count == 0) return false;
        if (!safelyDecrement(u8, toLower(char), &freq)) {
            return false;
        }
    }
    return true;
}

test "the ransomNote: a can be constructed from b" {
    const ransomNote = "a";
    const magazine = "b";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "the ransomNote: aa can be constructed from ab" {
    const ransomNote = "aa";
    const magazine = "ab";
    const expected = false;
    const allocator = std.testing.allocator;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "the ransomNote: aa can be constructed from aab" {
    const ransomNote = "aa";
    const magazine = "aab";
    const expected = true;
    const allocator = std.testing.allocator;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "the ransomNote: a can be constructed from a" {
    const allocator = std.testing.allocator;
    const ransomNote = "a";
    const magazine = "a";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "the ransomNote: abc can be constructed from cbad" {
    const allocator = std.testing.allocator;
    const ransomNote = "abc";
    const magazine = "cbad";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: '' can be constructed from anything" {
    const allocator = std.testing.allocator;
    const ransomNote = "";
    const magazine = "anything";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: a can be constructed from " {
    const allocator = std.testing.allocator;
    const ransomNote = "a";
    const magazine = "";
    const expected = false;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: '' can be constructed from ''" {
    const allocator = std.testing.allocator;
    const ransomNote = "";
    const magazine = "";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: aA can be constructed from aa" {
    const allocator = std.testing.allocator;
    const ransomNote = "aA";
    const magazine = "aa";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: Aa can be constructed from aA" {
    const allocator = std.testing.allocator;
    const ransomNote = "Aa";
    const magazine = "aA";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: zzz can be constructed from zzzzzz" {
    const allocator = std.testing.allocator;
    const ransomNote = "zzz";
    const magazine = "zzzzzz";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: zzzz can be constructed from zzz" {
    const allocator = std.testing.allocator;
    const ransomNote = "zzzz";
    const magazine = "zzz";
    const expected = false;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "the ransomNote: hello can be constructed from ld" {
    const allocator = std.testing.allocator;
    const ransomNote = "hello world";
    const magazine = "dlrow olleh";
    const expected = true;
    const result = canConstructRansomNote(allocator, ransomNote, magazine);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
