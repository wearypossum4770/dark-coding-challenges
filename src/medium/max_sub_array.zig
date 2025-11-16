const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn maxSubArray(comptime T: type, nums: []const T) T {
    var result = nums[0];
    var ending = nums[0];
    for (1..nums.len) |index| {
        ending = @max(ending + nums[index], nums[index]);
        result = @max(result, ending);
    }
    return result;
}
