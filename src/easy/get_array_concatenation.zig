const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn getArrayConcatenation(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, 2 * nums.len) catch return null;
    for (nums, 0..) |num, i| {
        result[i] = num;
        result[i + nums.len] = num;
    }
    return result;
}

test "clone and concatenate the array [1, 2, 1]" {
    const nums = [_]i8{ 1, 2, 1 };
    const expected = [_]i8{ 1, 2, 1, 1, 2, 1 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [1, 3, 2, 1]" {
    const nums = [_]i8{ 1, 3, 2, 1 };
    const expected = [_]i8{ 1, 3, 2, 1, 1, 3, 2, 1 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [1]" {
    const nums = [_]i8{1};
    const expected = [_]i8{ 1, 1 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [1000]" {
    const nums = [_]u16{1000};
    const expected = [_]u16{ 1000, 1000 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [1, 1, 1]" {
    const nums = [_]i8{ 1, 1, 1 };
    const expected = [_]i8{ 1, 1, 1, 1, 1, 1 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [2, 4, 6]" {
    const nums = [_]i8{ 2, 4, 6 };
    const expected = [_]i8{ 2, 4, 6, 2, 4, 6 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [5, 10]" {
    const nums = [_]i8{ 5, 10 };
    const expected = [_]i8{ 5, 10, 5, 10 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [0, 1, 0]" {
    const nums = [_]i8{ 0, 1, 0 };
    const expected = [_]i8{ 0, 1, 0, 0, 1, 0 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "clone and concatenate the array [1, 2, 3, 2, 1]" {
    const nums = [_]i8{ 1, 2, 3, 2, 1 };
    const expected = [_]i8{ 1, 2, 3, 2, 1, 1, 2, 3, 2, 1 };
    const allocator = std.testing.allocator;
    const result = getArrayConcatenation(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
