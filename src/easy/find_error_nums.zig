const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn findErrorNums(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    var target = [_]T{ 0, 0 };
    @memset(result, 0);
    defer allocator.free(result);
    for (nums) |n| {
        const index: usize = @intCast(n - 1);
        if (result[index] > 0) {
            target[0] = n;
        } else {
            result[index] = n;
        }
    }
    for (result, 0..) |n, i| {
        if (n == 0) {
            target[1] = @intCast(i + 1);
        }
    }
    return &target;
}
