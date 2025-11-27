const std = @import("std");

const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn maximumGap(comptime T: type, allocator: Allocator, nums: []const T) ?T {
    if (nums.len < 2) return 0;

    const arr = allocator.alloc(T, nums.len) catch return null;
    defer allocator.free(arr);
    std.mem.copyBackwards(T, arr, nums);
    std.mem.sort(T, arr, {}, std.sort.asc(T));
    var result: T = arr[1] - arr[0];
    var index: usize = 1;
    while (index < arr.len - 1) : (index += 1) {
        result = @max(result, arr[index + 1] - arr[index]);
    }

    return result;
}

test "maximum gap among the sorted array {3, 6, 9, 1}" {
    const nums = [_]u4{ 3, 6, 9, 1 };
    const expected: @TypeOf(nums[0]) = 3;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {10}" {
    const nums = [_]u4{10};
    const expected: @TypeOf(nums[0]) = 0;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 100}" {
    const nums = [_]u8{ 1, 100 };
    const expected: @TypeOf(nums[0]) = 99;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 2, 3, 4, 5}" {
    const nums = [_]u4{ 1, 2, 3, 4, 5 };
    const expected: @TypeOf(nums[0]) = 1;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {10, 9, 8, 7}" {
    const nums = [_]u4{ 10, 9, 8, 7 };
    const expected: @TypeOf(nums[0]) = 1;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {7, 7, 7, 7}" {
    const nums = [_]u4{ 7, 7, 7, 7 };
    const expected: @TypeOf(nums[0]) = 0;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {0, 1_000_000_000}" {
    const nums = [_]u32{ 0, 1_000_000_000 };
    const expected: @TypeOf(nums[0]) = 1_000_000_000;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 100, 2, 50_000_000}" {
    const nums = [_]u32{ 1, 100, 2, 50_000_000 };
    const expected: @TypeOf(nums[0]) = 49999900;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 1}" {
    const nums = [_]u4{ 1, 1 };
    const expected: @TypeOf(nums[0]) = 0;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {2, 2, 2, 3}" {
    const nums = [_]u4{ 2, 2, 2, 3 };
    const expected: @TypeOf(nums[0]) = 1;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {100, 3, 2, 1}" {
    const nums = [_]u7{ 100, 3, 2, 1 };
    const expected: @TypeOf(nums[0]) = 97;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 3, 1_000, 2_000}" {
    const nums = [_]u11{ 1, 3, 1_000, 2_000 };
    const expected: @TypeOf(nums[0]) = 1_000;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {8, 1, 6, 3, 9}" {
    const nums = [_]u4{ 8, 1, 6, 3, 9 };
    const expected: @TypeOf(nums[0]) = 3;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {5, 4, 3, 2, 1}" {
    const nums = [_]u4{ 5, 4, 3, 2, 1 };
    const expected: @TypeOf(nums[0]) = 1;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 2}" {
    const nums = [_]u4{ 1, 2 };
    const expected: @TypeOf(nums[0]) = 1;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1_000_000_000, 0, 999_999_999}" {
    const nums = [_]u32{ 1_000_000_000, 0, 999_999_999 };
    const expected: @TypeOf(nums[0]) = 999_999_999;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {1, 4, 7, 13, 20, 21}" {
    const nums = [_]u5{ 1, 4, 7, 13, 20, 21 };
    const expected: @TypeOf(nums[0]) = 7;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {5, 5, 5, 10}" {
    const nums = [_]u4{ 5, 5, 5, 10 };
    const expected: @TypeOf(nums[0]) = 5;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {0, 1, 2, 3, 100}" {
    const nums = [_]u7{ 0, 1, 2, 3, 100 };
    const expected: @TypeOf(nums[0]) = 97;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "maximum gap among the sorted array {100, 200, 300, 1_000}" {
    const nums = [_]u11{ 100, 200, 300, 1_000 };
    const expected: @TypeOf(nums[0]) = 700;
    const allocator = std.testing.allocator;
    const result = maximumGap(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
