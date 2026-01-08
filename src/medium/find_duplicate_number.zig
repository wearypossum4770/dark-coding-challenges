const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn findDuplicateNumber(comptime T: type, allocator: Allocator, nums: []const T) T {
    var result = allocator.alloc(T, nums.len + 1) catch return 0;
    @memset(result, 0);
    defer allocator.free(result);
    for (nums) |n| {
        const index: usize = @intCast(n);
        if (result[index] > 0) return n;
        result[index] += 1;
    }
    return 0;
}

test "find the duplicates in [1,1]" {
    const nums = [_]u35{ 1, 1 };
    const expected: u35 = 1;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [1,3,4,2,2]" {
    const nums = [_]u35{ 1, 3, 4, 2, 2 };
    const expected: u35 = 2;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [3,1,3,4,2]" {
    const nums = [_]u35{ 3, 1, 3, 4, 2 };
    const expected: u35 = 3;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [3,3,3,3,3]" {
    const nums = [_]u35{ 3, 3, 3, 3, 3 };
    const expected: u35 = 3;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [2,1,2]" {
    const nums = [_]u35{ 2, 1, 2 };
    const expected: u35 = 2;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [1,4,6,3,2,5,6]" {
    const nums = [_]u35{ 1, 4, 6, 3, 2, 5, 6 };
    const expected: u35 = 6;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [5,4,3,2,1,5]" {
    const nums = [_]u35{ 5, 4, 3, 2, 1, 5 };
    const expected: u35 = 5;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [1,2,3,4,5,6,7,8,9,9]" {
    const nums = [_]u35{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 9 };
    const expected: u35 = 9;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [2,2,2,2,2]" {
    const nums = [_]u35{ 2, 2, 2, 2, 2 };
    const expected: u35 = 2;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [1,1,2,3,4,5]" {
    const nums = [_]u35{ 1, 1, 2, 3, 4, 5 };
    const expected: u35 = 1;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [4,3,1,4,2]" {
    const nums = [_]u35{ 4, 3, 1, 4, 2 };
    const expected: u35 = 4;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [6,1,5,4,3,2,6]" {
    const nums = [_]u35{ 6, 1, 5, 4, 3, 2, 6 };
    const expected: u35 = 6;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [1,2,3,4,5,3]" {
    const nums = [_]u35{ 1, 2, 3, 4, 5, 3 };
    const expected: u35 = 3;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "find the duplicates in [7,6,5,4,3,2,1,7]" {
    const nums = [_]u35{ 7, 6, 5, 4, 3, 2, 1, 7 };
    const expected: u35 = 7;
    const allocator = std.testing.allocator;
    const actual = findDuplicateNumber(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
