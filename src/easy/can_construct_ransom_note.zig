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
