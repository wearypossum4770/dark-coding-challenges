const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const minInt = std.math.minInt;
pub fn secondLargest(comptime T: type, nums: []T) T {
    var first: T = minInt(T);
    var second: T = first;
    for (nums) |n| {
        if (first < n) {
            second = first;
            first = n;
        } else if (second < n and first > n) {
            second = n;
        }
    }
    return second;
}

test "find second largest integer of [10, 40, 30, 20, 50]" {
    var nums = [_]u6{ 10, 40, 30, 20, 50 };
    const expected: u6 = 40;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [25, 143, 89, 13, 105]" {
    var nums = [_]u8{ 25, 143, 89, 13, 105 };
    const expected: u8 = 105;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [54, 23, 11, 17, 10]" {
    var nums = [_]u8{ 54, 23, 11, 17, 10 };
    const expected: u8 = 23;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [513, 211, 131, 417, 11]" {
    var nums = [_]u10{ 513, 211, 131, 417, 11 };
    const expected: u10 = 417;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [63, 44, 11, 22, 33, 66, 65]" {
    var nums = [_]u8{ 63, 44, 11, 22, 33, 66, 65 };
    const expected: u8 = 65;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}

test "find second largest integer of [5, 5, 3]" {
    var nums = [_]i32{ 5, 5, 3 };
    const expected: i32 = 3;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [5, 5, 5, 4]" {
    var nums = [_]i32{ 5, 5, 5, 4 };
    const expected: i32 = 4;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [1, 2, 2, 1]" {
    var nums = [_]i32{ 1, 2, 2, 1 };
    const expected: i32 = 1;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [3, 3, 2, 2, 1]" {
    var nums = [_]i32{ 3, 3, 2, 2, 1 };
    const expected: i32 = 2;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [-1, -2, -3]" {
    var nums = [_]i32{ -1, -2, -3 };
    const expected: i32 = -2;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [-10, -20, -30, -40]" {
    var nums = [_]i32{ -10, -20, -30, -40 };
    const expected: i32 = -20;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [-5, -1, -3]" {
    var nums = [_]i32{ -5, -1, -3 };
    const expected: i32 = -3;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [-10, 0, 10]" {
    var nums = [_]i32{ -10, 0, 10 };
    const expected: i32 = 0;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [0, -1, 1]" {
    var nums = [_]i32{ 0, -1, 1 };
    const expected: i32 = 0;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
test "find second largest integer of [-1, -1, 0]" {
    var nums = [_]i32{ -1, -1, 0 };
    const expected: i32 = -1;
    const actual = secondLargest(@TypeOf(nums[0]), nums[0..]);
    try expectEqual(expected, actual);
}
