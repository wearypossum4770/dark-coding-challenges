const std = @import("std");

pub fn nextGreatestLetter(letters: []const u8, target: u8) u8 {
    for (letters) |char| {
        if (target < char) return char;
    }
    return letters[0];
}
