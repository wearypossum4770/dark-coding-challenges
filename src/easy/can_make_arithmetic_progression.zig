const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn canMakeArithmeticProgression(comptime T: type, allocator: Allocator, arr: []const T) bool {
    const nums = allocator.alloc(T, arr.len) catch return false;
    defer allocator.free(nums);
    std.mem.copyBackwards(T, nums, arr);
    std.mem.sort(T, nums, {}, std.sort.asc(T));
    const distance = nums[1] - nums[0];
    var index: usize = 0;
    while (index < nums.len - 1) : (index += 1) {
        if (nums[index + 1] - nums[index] != distance) return false;
    }
    return true;
}
