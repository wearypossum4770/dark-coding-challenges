const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const isPalindrome = @import("./is_palindrome.zig");

pub fn findFirstPalindrome(words: []const []const u8) []const u8 {
    for (words) |word| {
        if (isPalindrome.isPalindrome(word)) return word;
    }
    return "";
}
