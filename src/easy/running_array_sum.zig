const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn runningArraySum(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    for (nums, 0..) |n, i| {
        if (i == 0) {
            result[i] = n;
        } else {
            result[i] = result[i - 1] + n;
        }
    }
    return result;
}
