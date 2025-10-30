const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn sortArrayByParity(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    if (result.len < 2) {
        std.mem.copyBackwards(T, result, nums);
        return result;
    }
    var even: usize = 0;
    var odd: usize = nums.len - 1;
    for (nums) |n| {
        if (@mod(n, 2) == 0) {
            result[even] = n;
            even += 1;
        } else {
            result[odd] = n;
            if (odd > 0) {
                odd -= 1;
            }
        }
    }
    return result;
}

test "array [3, 1, 2, 4] sorted by even/odd parity" {
    const nums = [_]i32{ 3, 1, 2, 4 };
    const expected = [_]i32{ 2, 4, 1, 3 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [0] sorted by even/odd parity" {
    const nums = [_]i32{0};
    const expected = [_]i32{0};
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [] sorted by even/odd parity" {
    const nums = [_]u2{};
    const expected = [_]u2{};
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(u2, allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u2, &expected, actual);
    } else return error.SkipZigTest;
}
test "array [2] sorted by even/odd parity" {
    const nums = [_]u2{2};
    const expected = [_]u2{2};
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [1] sorted by even/odd parity" {
    const nums = [_]u2{1};
    const expected = [_]u2{1};
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [1, 3, 5, 7] sorted by even/odd parity" {
    const nums = [_]i32{ 1, 3, 5, 7 };
    const expected = [_]i32{ 7, 5, 3, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [2, 4, 6, 8] sorted by even/odd parity" {
    const nums = [_]i32{ 2, 4, 6, 8 };
    const expected = [_]i32{ 2, 4, 6, 8 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [1, 2, 3, 4, 5, 6] sorted by even/odd parity" {
    const nums = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const expected = [_]i32{ 2, 4, 6, 5, 3, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [2, 1, 4, 3, 6, 5] sorted by even/odd parity" {
    const nums = [_]i32{ 2, 1, 4, 3, 6, 5 };
    const expected = [_]i32{ 2, 4, 6, 5, 3, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [2, 2, 1, 1] sorted by even/odd parity" {
    const nums = [_]i32{ 2, 2, 1, 1 };
    const expected = [_]i32{ 2, 2, 1, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [1, 1, 2, 2] sorted by even/odd parity" {
    const nums = [_]i32{ 1, 1, 2, 2 };
    const expected = [_]i32{ 2, 2, 1, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [0, 0, 1, 1] sorted by even/odd parity" {
    const nums = [_]i32{ 0, 0, 1, 1 };
    const expected = [_]i32{ 0, 0, 1, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [0, 1, 2, 3, 4] sorted by even/odd parity" {
    const nums = [_]i32{ 0, 1, 2, 3, 4 };
    const expected = [_]i32{ 0, 2, 4, 3, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [0, 0, 0, 1] sorted by even/odd parity" {
    const nums = [_]i32{ 0, 0, 0, 1 };
    const expected = [_]i32{ 0, 0, 0, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [5000, 4999, 2500, 1] sorted by even/odd parity" {
    const nums = [_]i32{ 5000, 4999, 2500, 1 };
    const expected = [_]i32{ 5000, 2500, 1, 4999 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [7, 14, 21, 28, 35] sorted by even/odd parity" {
    const nums = [_]i32{ 7, 14, 21, 28, 35 };
    const expected = [_]i32{ 14, 28, 35, 21, 7 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [2, 4, 6, 1, 3, 5] sorted by even/odd parity" {
    const nums = [_]i32{ 2, 4, 6, 1, 3, 5 };
    const expected = [_]i32{ 2, 4, 6, 5, 3, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [9, 8, 7, 6, 5, 4] sorted by even/odd parity" {
    const nums = [_]i32{ 9, 8, 7, 6, 5, 4 };
    const expected = [_]i32{ 8, 6, 4, 5, 7, 9 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [10, 11, 12] sorted by even/odd parity" {
    const nums = [_]i32{ 10, 11, 12 };
    const expected = [_]i32{ 10, 12, 11 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "array [3, 5, 8, 9, 10] sorted by even/odd parity" {
    const nums = [_]i32{ 3, 5, 8, 9, 10 };
    const expected = [_]i32{ 8, 10, 9, 5, 3 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}

test "array [0, 1, 2] sorted by even/odd parity" {
    var nums = [_]i32{ 0, 1, 2 };
    const expected = [_]i32{ 0, 2, 1 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParity(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
