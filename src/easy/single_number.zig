const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn singleNumber(nums: []const i32) i32 {
    var result: i32 = 0;
    for (nums) |num| {
        result ^= num;
    }
    return result;
}

test "decreasing order lower value non-repeating" {
    const nums = [_]i32{ 2, 2, 1 };
    const expected: i32 = 1;
    const actual = singleNumber(&nums);
    try expectEqual(expected, actual);
}
test "unordered list, higher value non-repeating" {
    const nums = [_]i32{ 4, 1, 2, 1, 2 };
    const expected: i32 = 4;
    const actual = singleNumber(&nums);
    try expectEqual(expected, actual);
}
test "single element array" {
    const nums = [_]i32{1};
    const expected: i32 = 1;
    const actual = singleNumber(&nums);
    try expectEqual(expected, actual);
}
