const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn arrayPairSum(comptime T: type, allocator: Allocator, nums: []const T) ?T {
    var total: T = 0;
    const arr = allocator.dupe(T, nums) catch return null;
    defer allocator.free(arr);
    std.mem.sort(T, arr, {}, std.sort.asc(T));
    std.mem.reverse(T, arr);
    var index: usize = 0;
    while (index < nums.len - 1) : (index += 2) {
        total += @min(arr[index], arr[index + 1]);
    }
    return total;
}

test "maximum sum of pairs for (1, 4, 3, 2)" {
    const nums = [_]i32{ 1, 4, 3, 2 };
    const expected: i32 = 4;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (6, 2, 6, 5, 1, 2)" {
    const nums = [_]i32{ 6, 2, 6, 5, 1, 2 };
    const expected: i32 = 9;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (1, 1)" {
    const nums = [_]i32{ 1, 1 };
    const expected: i32 = 1;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (0, 0)" {
    const nums = [_]i32{ 0, 0 };
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (-1, -1)" {
    const nums = [_]i32{ -1, -1 };
    const expected: i32 = -1;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (10_000, 10_000)" {
    const nums = [_]i32{ 10_000, 10_000 };
    const expected: i32 = 10_000;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (5, 5, 5, 5)" {
    const nums = [_]i32{ 5, 5, 5, 5 };
    const expected: i32 = 10;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (7, 7, 7, 7, 7, 7)" {
    const nums = [_]i32{ 7, 7, 7, 7, 7, 7 };
    const expected: i32 = 21;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (1, 2, 3, 4, 5, 6)" {
    const nums = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const expected: i32 = 9;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (6, 5, 4, 3, 2, 1)" {
    const nums = [_]i32{ 6, 5, 4, 3, 2, 1 };
    const expected: i32 = 9;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (-5, -4, -3, -2)" {
    const nums = [_]i32{ -5, -4, -3, -2 };
    const expected: i32 = -8;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (-10, -1, 1, 10)" {
    const nums = [_]i32{ -10, -1, 1, 10 };
    const expected: i32 = -9;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (-10_000, 10_000, -9_999, 9_999)" {
    const nums = [_]i32{ -10_000, 10_000, -9_999, 9_999 };
    const expected: i32 = -1;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (1, 100, 2, 99, 3, 98)" {
    const nums = [_]i32{ 1, 100, 2, 99, 3, 98 };
    const expected: i32 = 100 + 3;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (0, 0, 0, 0, 0, 0)" {
    const nums = [_]i32{ 0, 0, 0, 0, 0, 0 };
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum sum of pairs for (-10_000, 10_000)" {
    const nums = [_]i32{ -10_000, 10_000 };
    const expected: i32 = -10_000;
    const allocator = std.testing.allocator;
    const result = arrayPairSum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
