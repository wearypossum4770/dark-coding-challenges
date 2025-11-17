const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn shuffleArrayToCoordinates(comptime T: type, allocator: Allocator, nums: []const T, n: T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    for (0..n) |i| {
        result[2 * i] = nums[i];
        result[2 * i + 1] = nums[i + n];
    }
    return result;
}

test "shuffle the array [2,5,1,3,4,7] with value 3" {
    const nums = [_]u6{ 2, 5, 1, 3, 4, 7 };
    const n: @TypeOf(nums[0]) = 3;
    const expected = [_]u6{ 2, 3, 5, 4, 1, 7 };
    const allocator = std.testing.allocator;
    const result = shuffleArrayToCoordinates(@TypeOf(nums[0]), allocator, &nums, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "shuffle the array [1,2,3,4,4,3,2,1] with value 4" {
    const nums = [_]u6{ 1, 2, 3, 4, 4, 3, 2, 1 };
    const n: @TypeOf(nums[0]) = 4;
    const expected = [_]u6{ 1, 4, 2, 3, 3, 2, 4, 1 };
    const allocator = std.testing.allocator;
    const result = shuffleArrayToCoordinates(@TypeOf(nums[0]), allocator, &nums, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "shuffle the array [1,1,2,2] with value 2" {
    const nums = [_]u6{ 1, 1, 2, 2 };
    const n: @TypeOf(nums[0]) = 2;
    const expected = [_]u6{ 1, 2, 1, 2 };
    const allocator = std.testing.allocator;
    const result = shuffleArrayToCoordinates(@TypeOf(nums[0]), allocator, &nums, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
