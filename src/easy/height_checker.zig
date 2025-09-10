const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn heightChecker(comptime T: type, allocator: Allocator, heights: []const T) ?usize {
    var count: usize = 0;
    const dest = allocator.alloc(T, heights.len) catch return null;
    std.mem.copyBackwards(T, dest, heights);
    std.mem.sort(T, dest, {}, comptime std.sort.asc(T));
    defer allocator.free(dest);
    for (heights, 0..) |_, i| {
        if (heights[i] != dest[i]) {
            count += 1;
        }
    }
    return count;
}

test "count the number of elements out of order [1, 1, 4, 2, 1, 3]" {
    const nums = [_]i32{ 1, 1, 4, 2, 1, 3 };
    const expected: usize = 3;
    const allocator = std.testing.allocator;
    const result = heightChecker(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "count the number of elements out of order [5, 1, 2, 3, 4]" {
    const nums = [_]i32{ 5, 1, 2, 3, 4 };
    const expected: usize = 5;
    const allocator = std.testing.allocator;
    const result = heightChecker(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "count the number of elements out of order [1, 2, 3, 4, 5]" {
    const nums = [_]i32{ 1, 2, 3, 4, 5 };
    const expected: usize = 0;
    const allocator = std.testing.allocator;
    const result = heightChecker(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "count the number of elements out of order [10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7]" {
    const nums = [_]i32{ 10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7 };
    const expected: usize = 22;
    const allocator = std.testing.allocator;
    const result = heightChecker(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
