const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn getArrayConcatenation(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, 2 * nums.len) catch return null;
    for (nums, 0..) |num, i| {
        result[i] = num;
        result[i + nums.len] = num;
    }
    return result;
}
