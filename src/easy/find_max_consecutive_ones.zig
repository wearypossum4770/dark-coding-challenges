const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn findMaxConsecutiveOnes(nums: []const u1) usize {
    var count: usize = 0;
    var max: usize = 0;
    for (nums) |n| {
        if (max < count) {
            max = count;
        }
        if (n == 1) {
            count += 1;
        } else {
            count = 0;
        }
    }
    if (max < count) return count;
    return max;
}
