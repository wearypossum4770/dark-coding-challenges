const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const IterTools = @import("./itertools.zig");

pub fn findLucky(comptime T: type, allocator: Allocator, arr: []const T) ?i32 {
    var nums = allocator.alloc(usize, IterTools.arrayMax(T, arr) + 1) catch return null;
    @memset(nums, 0);
    defer allocator.free(nums);
    var index = nums.len - 1;
    for (arr) |num| {
        const i: usize = @intCast(num);
        nums[i] += 1;
    }
    while (index > 0) : (index -= 1) {
        if (nums[index] == index) return @intCast(index);
    }
    return -1;
}

test "find maximum frequency for the integer that matches index of [2,2,3,4]" {
    const arr = [_]i32{ 2, 2, 3, 4 };
    const expected: i32 = 2;
    const allocator = std.testing.allocator;
    const result = findLucky(@TypeOf(arr[0]), allocator, &arr);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find maximum frequency for the integer that matches index of [1,2,2,3,3,3]" {
    const arr = [_]i32{ 1, 2, 2, 3, 3, 3 };
    const expected: i32 = 3;
    const allocator = std.testing.allocator;
    const result = findLucky(@TypeOf(arr[0]), allocator, &arr);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find maximum frequency for the integer that matches index of [2,2,2,3,3]" {
    const arr = [_]i32{ 2, 2, 2, 3, 3 };
    const expected: i32 = -1;
    const allocator = std.testing.allocator;
    const result = findLucky(@TypeOf(arr[0]), allocator, &arr);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
