const std = @import("std");
const expectEqualStrings = std.testing.expectEqualStrings;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;
const IterTools = @import("./itertools.zig");
const isVowel = IterTools.isVowel;

pub fn reverseVowels(allocator: Allocator, s: []const u8) ?[]const u8 {
    var result = allocator.alloc(u8, s.len) catch return null;
    if (s.len < 2) {
        std.mem.copyBackwards(u8, result, s);
        return result;
    }
    var left: usize = 0;
    var right = s.len - 1;
    while (left <= right) {
        if (!isVowel(s[left])) {
            result[left] = s[left];
            left += 1;
        } else if (!isVowel(s[right])) {
            result[right] = s[right];
            right -= 1;
        } else {
            result[right] = s[left];
            result[left] = s[right];
            right -= 1;
            left += 1;
        }
    }
    return result;
}
