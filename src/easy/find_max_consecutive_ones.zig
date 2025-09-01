const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn findMaxConsecutiveOnes(nums: []const u1) usize {
    var count: usize = 0;
    var max: usize = 0;
    for (nums) |n| {
        if (max < count) {
            max = count;
        }
        if (n == 1) {
            count += 1;
        } else {
            count = 0;
        }
    }
    if (max < count) return count;
    return max;
}

test "count the maximum consecutive one in [1,1,0,1,1,1]" {
    const nums = [_]u1{ 1, 1, 0, 1, 1, 1 };
    const expected: usize = 3;
    const actual = findMaxConsecutiveOnes(&nums);
    try expectEqual(expected, actual);
}
test "count the maximum consecutive one in [1,0,1,1,0,1]" {
    const nums = [_]u1{ 1, 0, 1, 1, 0, 1 };
    const expected: usize = 2;
    const actual = findMaxConsecutiveOnes(&nums);
    try expectEqual(expected, actual);
}
test "count the maximum consecutive one in [0]" {
    const nums = [_]u1{0};
    const expected: usize = 0;
    const actual = findMaxConsecutiveOnes(&nums);
    try expectEqual(expected, actual);
}
test "count the maximum consecutive one in [1]" {
    const nums = [_]u1{1};
    const expected: usize = 1;
    const actual = findMaxConsecutiveOnes(&nums);
    try expectEqual(expected, actual);
}
test "count the maximum consecutive one in [1, 1, 1, 1]" {
    const nums = [_]u1{ 1, 1, 1, 1 };
    const expected: usize = 4;
    const actual = findMaxConsecutiveOnes(&nums);
    try expectEqual(expected, actual);
}
