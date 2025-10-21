const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn numOfUnplacedFruits(comptime T: type, allocator: Allocator, fruits: []const T, baskets: []const T) ?usize {
    var count: usize = baskets.len;
    var replaced = allocator.alloc(bool, count) catch return null;
    @memset(replaced, false);
    defer allocator.free(replaced);
    for (fruits) |fruit| {
        for (baskets, 0..) |basket, i| {
            if (basket >= fruit and !replaced[i]) {
                replaced[i] = true;
                if (count > 0) {
                    count -= 1;
                } else {
                    count = 0;
                }
                break;
            }
        }
    }
    return count;
}
