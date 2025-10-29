const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn sortArrayByParity(comptime T: type, nums: []T) []T {
    var left: usize = 0;
    var right: usize = nums.len - 1;
    while (left < right) {
        if (@mod(nums[left], 2) == 0) {
            left += 1;
        } else if (@mod(nums[right], 2) == 1) {
            right -= 1;
        } else {
            const temp = nums[left];
            nums[left] = nums[right];
            nums[right] = temp;
            left += 1;
            right -= 1;
        }
    }
    return nums;
}
