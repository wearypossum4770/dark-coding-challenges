const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const IterTools = @import("./itertools.zig");

pub fn findLucky(comptime T: type, allocator: Allocator, arr: []const T) ?i32 {
    var nums = allocator.alloc(usize, IterTools.arrayMax(T, arr) + 1) catch return null;
    @memset(nums, 0);
    defer allocator.free(nums);
    var index = nums.len - 1;
    for (arr) |num| {
        const i: usize = @intCast(num);
        nums[i] += 1;
    }
    while (index > 0) : (index -= 1) {
        if (nums[index] == index) return @intCast(index);
    }
    return -1;
}
