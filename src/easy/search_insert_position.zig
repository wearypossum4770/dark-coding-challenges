const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn searchInsertPosition(comptime T: type, nums: []const T, target: T) usize {
    var left: usize = 0;
    var right: usize = nums.len - 1;
    while (left <= right) {
        const mid = left + (right - left) / 2;
        if (nums[mid] == target) return mid;
        if (nums[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }

    return left;
}

test "find the insertion point inside [1, 3, 5, 6] for  5" {
    const nums = [_]i32{ 1, 3, 5, 6 };
    const target: i32 = 5;
    const expected: usize = 2;
    const actual = searchInsertPosition(@TypeOf(nums[0]), &nums, target);
    try expectEqual(expected, actual);
}
test "find the insertion point inside [1, 3, 5, 6] for  2" {
    const nums = [_]i32{ 1, 3, 5, 6 };
    const target: i32 = 2;
    const expected: usize = 1;
    const actual = searchInsertPosition(@TypeOf(nums[0]), &nums, target);
    try expectEqual(expected, actual);
}
test "find the insertion point inside [1, 3, 5, 6] for  7" {
    const nums = [_]i32{ 1, 3, 5, 6 };
    const target: i32 = 7;
    const expected: usize = 4;
    const actual = searchInsertPosition(@TypeOf(nums[0]), &nums, target);
    try expectEqual(expected, actual);
}
test "find the insertion point inside [1] for  1" {
    const nums = [_]i32{1};
    const target: i32 = 1;
    const expected: usize = 0;
    const actual = searchInsertPosition(@TypeOf(nums[0]), &nums, target);
    try expectEqual(expected, actual);
}
