const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn runningArraySum(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    for (nums, 0..) |n, i| {
        if (i == 0) {
            result[i] = n;
        } else {
            result[i] = result[i - 1] + n;
        }
    }
    return result;
}

test "✅ Normal case" {
    const nums = [_]i32{ 1, 2, 3, 4 };
    const expected = [_]i32{ 1, 3, 6, 10 };
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "✅ All 1s" {
    const nums = [_]i32{ 1, 1, 1, 1, 1 };
    const expected = [_]i32{ 1, 2, 3, 4, 5 };
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "✅ Mixed values" {
    const nums = [_]i32{ 3, 1, 2, 10, 1 };
    const expected = [_]i32{ 3, 4, 6, 16, 17 };
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "🟢 Empty array" {
    const nums = [_]i32{};
    const expected = [_]i32{};
    const allocator = std.testing.allocator;
    const result = runningArraySum(i32, allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}
test "🟢 Single element" {
    const nums = [_]i32{5};
    const expected = [_]i32{5};
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "🟢 Negative numbers" {
    const nums = [_]i32{ -1, -2, -3 };
    const expected = [_]i32{ -1, -3, -6 };
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}

test "🟢 Alternating positives & negatives" {
    const nums = [_]i32{ 1, -1, 1, -1, 1 };
    const expected = [_]i32{ 1, 0, 1, 0, 1 };
    const allocator = std.testing.allocator;
    const result = runningArraySum(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
