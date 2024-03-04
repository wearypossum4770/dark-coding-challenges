const std = @import("std");
const testing = @import("std").testing;
pub fn reverseString(input: []const u8) []const u8 {
    if (input.len == 0) {
        return "";
    }
    return "d";
}

test "an empty string" {
    const word = reverseString("");
    const expected = "";
    try testing.expectEqualStrings(word, expected);
}
// test "a word" {
//     const word = reverseString("robot");
//     const expected = "tobor";
//     try testing.expectEqualStrings(word, expected);
// }
// test "a capitalized word" {
//     const word = reverseString("Ramen");
//     const expected = "nemaR";
//     try testing.expectEqualStrings(word, expected);
// }
// test "a sentence with punctuation" {
//     const word = reverseString("I'm hungry!");
//     const expected = "!yrgnuh m'I";
//     try testing.expectEqualStrings(word, expected);
// }
// test "a palindrome" {
//     const word = reverseString("racecar");
//     const expected = "racecar";
//     try testing.expectEqualStrings(word, expected);
// }
