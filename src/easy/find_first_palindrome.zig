const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const isPalindrome = @import("./is_palindrome.zig");

pub fn findFirstPalindrome(words: []const []const u8) []const u8 {
    for (words) |word| {
        if (isPalindrome.isPalindrome(word)) return word;
    }
    return "";
}

test "['zabc','car','ada','racecar','cool']" {
    const words = [_][]const u8{ "abc", "car", "ada", "racecar", "cool" };
    const expected = "ada";
    const actual = findFirstPalindrome(&words);
    try expectEqualStrings(expected, actual);
}
test "['notapalindrome','racecar']" {
    const words = [_][]const u8{ "notapalindrome", "racecar" };
    const expected = "racecar";
    const actual = findFirstPalindrome(&words);
    try expectEqualStrings(expected, actual);
}
test "['def','ghi']" {
    const words = [_][]const u8{ "def", "ghi" };
    const expected = "";
    const actual = findFirstPalindrome(&words);
    try expectEqualStrings(expected, actual);
}
