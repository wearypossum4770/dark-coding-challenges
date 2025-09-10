const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn heightChecker(comptime T: type, allocator: Allocator, heights: []const T) ?usize {
    var count: usize = 0;
    const dest = allocator.alloc(T, heights.len) catch return null;
    std.mem.copyBackwards(T, dest, heights);
    std.mem.sort(T, dest, {}, comptime std.sort.asc(T));
    defer allocator.free(dest);
    for (heights, 0..) |_, i| {
        if (heights[i] != dest[i]) {
            count += 1;
        }
    }
    return count;
}
