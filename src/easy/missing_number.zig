const std = @import("std");
const IterTools = @import("./itertools.zig");

const reduce = IterTools.reduce;

pub fn missingNumber(comptime T: type, nums: []const T) T {
    if (nums.len == 0) return 0;

    const expected: T = @intCast(@divExact(nums.len * (nums.len + 1), 2));
    const total = reduce(T, nums, 0, struct {
        pub fn add(a: T, b: T) T {
            return a + b;
        }
    }.add);
    return expected - total;
}
