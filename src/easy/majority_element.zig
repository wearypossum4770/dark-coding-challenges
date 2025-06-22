const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const TextTools = @import("text_tools.zig");
const Allocator = std.mem.Allocator;

pub fn majorityElement(allocator: Allocator, nums: []const i32) i32 {
    const half: i32 = @intCast(nums.len / 2);
    var count = TextTools.countCharacters(i32, allocator, nums) orelse return 0;
    defer count.deinit();
    var iter = count.iterator();
    while (iter.next()) |entry| {
        if (entry.value_ptr.* > half) {
            return entry.key_ptr.*;
        }
    }

    return 0;
}

test "majority element at polar ends" {
    const nums = [_]i32{ 2, 1, 2 };
    const expected: i32 = 2;
    const allocator = std.testing.allocator;
    const actual = majorityElement(allocator, &nums);
    try expectEqual(expected, actual);
}
test "single item element" {
    const nums = [_]i32{100};
    const expected: i32 = 100;
    const allocator = std.testing.allocator;
    const actual = majorityElement(allocator, &nums);
    try expectEqual(expected, actual);
}
test "majority element at end" {
    const nums = [_]i32{ 2, 1, 1 };
    const expected: i32 = 1;
    const allocator = std.testing.allocator;
    const actual = majorityElement(allocator, &nums);
    try expectEqual(expected, actual);
}

test "majority element in between" {
    const nums = [_]i32{ 3, 2, 3 };
    const expected: i32 = 3;
    const allocator = std.testing.allocator;
    const actual = majorityElement(allocator, &nums);
    try expectEqual(expected, actual);
}
test "majority element at end multiple" {
    const nums = [_]i32{ 2, 2, 1, 1, 1, 2, 2 };
    const expected: i32 = 2;
    const allocator = std.testing.allocator;
    const actual = majorityElement(allocator, &nums);
    try expectEqual(expected, actual);
}
