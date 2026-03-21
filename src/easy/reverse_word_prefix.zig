const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn reverseWordPrefix(allocator: Allocator, word: []const u8, ch: u8) ?[]const u8 {
    var result = allocator.alloc(u8, word.len) catch return null;
    for (word, 0..) |char, i| {
        if (char == ch) {
            var index: usize = 0;
            var left = i + 1;
            var right = i + 1;
            while (left > 0) {
                left -= 1;
                result[index] = word[left];
                index += 1;
            }
            while (right < word.len) {
                result[index] = word[right];
                right += 1;
                index += 1;
            }
            return result;
        }
    }
    defer allocator.free(result);
    return allocator.dupe(u8, word) catch return null;
}
