const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const AutoHashMap = std.hash_map.AutoHashMap;

pub fn containsDuplicate(comptime T: type, allocator: Allocator, nums: []const T) bool {
    var unique = AutoHashMap(T, bool).init(allocator);
    defer unique.deinit();
    for (nums) |n| {
        if (unique.contains(n)) return true;
        unique.put(n, true) catch return false;
    }
    return false;
}

test "duplicate exists in [1, 2, 3, 1]" {
    const nums = [_]u2{ 1, 2, 3, 1 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [1, 2, 3, 4]" {
    const nums = [_]u4{ 1, 2, 3, 4 };
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [1, 1, 1...]" {
    const nums = [_]u5{ 1, 1, 1, 3, 3, 4, 3, 2, 4, 2 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in []" {
    const nums = [_]i32{};
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(i32, allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [5]" {
    const nums = [_]i32{5};
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [0, 0]" {
    const nums = [_]u0{ 0, 0 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [-1, -1]" {
    const nums = [_]i2{ -1, -1 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [1_000_000_000, 1_000_000_000]" {
    const nums = [_]i32{ 1_000_000_000, 1_000_000_000 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [-1_000_000_000, -1_000_000_000]" {
    const nums = [_]i32{ -1_000_000_000, -1_000_000_000 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [1, 2, 3, 4...]" {
    const nums = [_]u6{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 1 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [0, 1, 2, 3, 4, 5...]" {
    const nums = [_]i32{ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [7, 7, 7...]" {
    const nums = [_]i32{ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [100, 200, 300, 400, 500...]" {
    const nums = [_]i32{ 100, 200, 300, 400, 500, 600, 700, 800, 900, 1_000, 42, 42 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [-5, -4, -3, -2...]" {
    const nums = [_]i32{ -5, -4, -3, -2, -1, 0, 0, 1, 2, 3 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [42, 1, 2, 3, 4...]" {
    const nums = [_]i32{ 42, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 42 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [1, 1, 2, 2...]" {
    const nums = [_]i32{ 1, 1, 2, 2, 3, 3, 4, 4, 5, 5 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [999_999_999, 999_999_999]" {
    const nums = [_]i32{ 999_999_999, 999_999_999 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [-1_000_000_000, 0, 1_000_000_000, -1_000_000_000]" {
    const nums = [_]i32{ -1_000_000_000, 0, 1_000_000_000, -1_000_000_000 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
test "duplicate exists in [2, 4, 6, 8, 10...]" {
    const nums = [_]i32{ 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 2 };
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = containsDuplicate(@TypeOf(nums[0]), allocator, &nums);
    try expectEqual(expected, actual);
}
