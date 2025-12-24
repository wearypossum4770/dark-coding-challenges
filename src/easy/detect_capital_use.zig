const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn allLowerCased(word: []const u8) bool {
    for (word) |char| {
        if (char < 97 or char > 122) return false;
    }
    return true;
}

pub fn allUpperCase(word: []const u8) bool {
    for (word) |char| {
        if (char < 65 or char > 90) return false;
    }
    return true;
}

pub fn firstLetterCapital(char: u8) bool {
    return char >= 65 and char <= 90;
}

pub fn detectCapitalUse(word: []const u8) bool {
    if (firstLetterCapital(word[0])) {
        return allUpperCase(word[1..]) or allLowerCased(word[1..]);
    }
    return allLowerCased(word);
}

test "all uppercase" {
    const word = "USA";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "all lowercase" {
    const word = "leetcode";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "first uppercase only" {
    const word = "Google";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "mixed wrong case" {
    const word = "FlaG";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "single lowercase" {
    const word = "g";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "single uppercase" {
    const word = "G";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "uppercase in middle" {
    const word = "LeetCode";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "first lowercase, uppercase later" {
    const word = "aPPle";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "all uppercase long" {
    const word = "APPLE";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "all lowercase long" {
    const word = "apple";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "title case" {
    const word = "Apple";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "wrong capital in middle" {
    const word = "AppLe";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "lowercase then uppercase for zZZ" {
    const word = "zZZ";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "uppercase then lowercase then uppercase" {
    const word = "HELlo";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "lowercase only" {
    const word = "qwerty";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "first uppercase okay" {
    const word = "Qwerty";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "uppercase only" {
    const word = "QWERTY";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "alternating cases" {
    const word = "QwErTy";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "first uppercase rest lowercase" {
    const word = "Abcdefg";
    const expected = true;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}

test "lowercase then uppercase" {
    const word = "abcdEfg";
    const expected = false;
    const actual = detectCapitalUse(word);
    try expectEqual(expected, actual);
}
