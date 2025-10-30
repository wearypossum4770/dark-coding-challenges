const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn sortArrayByParity(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    if (result.len < 2) {
        std.mem.copyBackwards(T, result, nums);
        return result;
    }
    var even: usize = 0;
    var odd: usize = nums.len - 1;
    for (nums) |n| {
        if (@mod(n, 2) == 0) {
            result[even] = n;
            even += 1;
        } else {
            result[odd] = n;
            if (odd > 0) {
                odd -= 1;
            }
        }
    }
    return result;
}
