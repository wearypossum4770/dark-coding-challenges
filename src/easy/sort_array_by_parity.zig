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

test "array [3, 1, 2, 4] sorted by even/odd parity" {
    var nums = [_]i32{ 3, 1, 2, 4 };
    const expected = [_]i32{ 4, 2, 1, 3 };
    const actual = sortArrayByParity(@TypeOf(nums[0]), &nums);
    try expectEqualSlices(i32, &expected, actual);
}

test "array [0, 1, 2] sorted by even/odd parity" {
    var nums = [_]i32{ 0, 1, 2 };
    const expected = [_]i32{ 0, 2, 1 };
    const actual = sortArrayByParity(@TypeOf(nums[0]), &nums);
    try expectEqualSlices(i32, &expected, actual);
}

test "array [0] sorted by even/odd parity" {
    var nums = [_]i32{0};
    const expected = [_]i32{0};
    const actual = sortArrayByParity(@TypeOf(nums[0]), &nums);
    try expectEqualSlices(i32, &expected, actual);
}
