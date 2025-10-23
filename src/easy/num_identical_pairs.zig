const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn numIdenticalPairs(comptime T: type, nums: []const T) i32 {
    var count: i32 = 0;
    var left: usize = 0;
    while (left < nums.len) {
        var right = left + 1;
        while (right < nums.len) {
            if (nums[left] == nums[right]) {
                count += 1;
            }
            right += 1;
        }
        left += 1;
    }
    return count;
}
