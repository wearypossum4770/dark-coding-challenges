const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn removeElement(nums: []i32, val: i32) i32 {
    var result: usize = 0;

    for (0..nums.len) |index| {
        if (val != nums[index]) {
            nums[result] = nums[index];
            result += 1;
        }
    }

    return @intCast(result);
}

test "target at array ends" {
    var nums = [_]i32{ 3, 2, 2, 3 };
    const result = [_]i32{ 2, 2 };
    const target: i32 = 3;
    const expected: i32 = 2;
    const actual = removeElement(&nums, target);
    const index: usize = @intCast(actual);
    try expectEqual(expected, actual);
    try expectEqualSlices(i32, result[0..], nums[0..index]);
}

test "target permeates the array" {
    var nums = [_]i32{ 0, 1, 2, 2, 3, 0, 4, 2 };
    const result = [_]i32{ 0, 1, 3, 0, 4 };
    const target: i32 = 2;
    const expected: i32 = 5;
    const actual = removeElement(&nums, target);
    const index: usize = @intCast(actual);
    try expectEqual(expected, actual);
    try expectEqualSlices(i32, result[0..], nums[0..index]);
}
