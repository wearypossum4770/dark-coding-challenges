const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn smallerNumbersThanCurrent(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    @memset(result, 0);
    for (nums, 0..) |num, i| {
        var j: usize = 0;
        while (j < nums.len) : (j += 1) {
            if (num > nums[j]) {
                result[i] += 1;
            }
        }
    }
    return result;
}
