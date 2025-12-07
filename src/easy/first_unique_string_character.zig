const std = @import("std");

const TextTools = @import("text_tools.zig");
const charIndex = TextTools.caseInsensitiveAlphaToIndex;

pub fn firstUniqueStringCharacter(s: []const u8) i32 {
    var length: i32 = 0;
    var table = [_]u8{0} ** 26;
    for (s) |char| {
        table[charIndex(char)] += 1;
    }
    for (s) |char| {
        if (table[charIndex(char)] == 1) {
            return length;
        } else {
            length += 1;
        }
    }
    return -1;
}
