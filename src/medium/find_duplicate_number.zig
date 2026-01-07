const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn findDuplicateNumber(comptime T: type, allocator: Allocator, nums: []const T) T {
    var result = allocator.alloc(T, nums.len + 1) catch return 0;
    @memset(result, 0);
    defer allocator.free(result);
    for (nums) |n| {
        const index: usize = @intCast(n);
        if (result[index] > 0) return n;
        result[index] += 1;
    }
    return 0;
}
