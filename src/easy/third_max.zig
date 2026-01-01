const std = @import("std");

const expectEqual = std.testing.expectEqual;

const minInt = std.math.minInt;

pub fn thirdMax(comptime T: type, nums: []const T) T {
    var first: T = minInt(T);
    var second = first;
    var third = first;
    for (nums) |n| {
        if (first == n) continue;
        if (first < n) {
            third = second;
            second = first;
            first = n;
        } else if (second < n and first > n) {
            third = second;
            second = n;
        } else if (third < n and second > n) {
            third = n;
        }
    }
    return if (third != minInt(T)) third else first;
}

test "find third largest in [1, 2, 3, 4, 5]" {
    const nums = [_]i32{ 1, 2, 3, 4, 5 };
    const expected: i32 = 3;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [5, 4, 3, 2, 1]" {
    const nums = [_]i32{ 5, 4, 3, 2, 1 };
    const expected: i32 = 3;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [10, 20, 30, 40]" {
    const nums = [_]i32{ 10, 20, 30, 40 };
    const expected: i32 = 20;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [3, 2, 1]" {
    const nums = [_]i32{ 3, 2, 1 };
    const expected: i32 = 1;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest with doubles in [5, 5, 3, 2]" {
    const nums = [_]i32{ 5, 5, 3, 2 };
    const expected: i32 = 2;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest with doubles in [1, 2, 2, 3, 3]" {
    const nums = [_]i32{ 1, 2, 2, 3, 3 };
    const expected: i32 = 1;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [-1, -2, -3, -4]" {
    const nums = [_]i32{ -1, -2, -3, -4 };
    const expected: i32 = -3;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [-10, -20, -30]" {
    const nums = [_]i32{ -10, -20, -30 };
    const expected: i32 = -30;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [-10, 0, 10]" {
    const nums = [_]i32{ -10, 0, 10 };
    const expected: i32 = -10;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "find third largest in [0, -1, 1, 2]" {
    const nums = [_]i32{ 0, -1, 1, 2 };
    const expected: i32 = 0;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}

test "find third largest i32 in {3, 2, 1}" {
    const nums = [_]i32{ 3, 2, 1 };
    const expected: i32 = 1;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}

test "find third largest i32 in {1, 2}" {
    const nums = [_]i32{ 1, 2 };
    const expected: i32 = 2;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}

test "find third largest i32 in {2, 2, 3, 1}" {
    const nums = [_]i32{ 2, 2, 3, 1 };
    const expected: i32 = 1;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}

test "find third largest i32 in {5, 5, 5}" {
    const nums = [_]i32{ 5, 5, 5 };
    const expected: i32 = 5;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}

test "find third largest i64 in {-1, -2, -3}" {
    const nums = [_]i64{ -1, -2, -3 };
    const expected: i64 = -3;
    const actual = thirdMax(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
