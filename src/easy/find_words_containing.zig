const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

fn arrayContains(comptime T: type, haystack: []const T, needle: T) bool {
    for (haystack) |hay| {
        if (hay == needle) return true;
    }
    return false;
}
pub fn findWordsContaining(allocator: Allocator, words: []const []const u8, x: u8) ?[]const usize {
    var result = allocator.alloc(usize, words.len) catch return null;
    defer allocator.free(result);
    var index: usize = 0;
    for (words, 0..) |word, i| {
        if (arrayContains(u8, word, x)) {
            result[index] = i;
            index += 1;
        }
    }
    const copy = allocator.alloc(usize, index) catch return null;
    std.mem.copyForwards(usize, copy, result[0..index]);
    return copy;
}
