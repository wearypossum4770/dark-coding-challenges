const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn shuffleArrayToCoordinates(comptime T: type, allocator: Allocator, nums: []const T, n: T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    for (0..n) |i| {
        result[2 * i] = nums[i];
        result[2 * i + 1] = nums[i + n];
    }
    return result;
}
