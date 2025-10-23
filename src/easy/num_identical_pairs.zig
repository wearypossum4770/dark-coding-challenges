const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn numIdenticalPairs(comptime T: type, nums: []const T) i32 {
    var count: i32 = 0;
    var left: usize = 0;
    while (left < nums.len) {
        var right = left + 1;
        while (right < nums.len) {
            if (nums[left] == nums[right]) {
                count += 1;
            }
            right += 1;
        }
        left += 1;
    }
    return count;
}

test "the numb of good pairs for [1,1,1,1]" {
    const nums = [_]i32{ 1, 1, 1, 1 };
    const expected: i32 = 6;
    const actual = numIdenticalPairs(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "the numb of good pairs for [1,2,3]" {
    const nums = [_]i32{ 1, 2, 3 };
    const expected: i32 = 0;
    const actual = numIdenticalPairs(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "the numb of good pairs for [1,2,3,1,1,3]" {
    const nums = [_]i32{ 1, 2, 3, 1, 1, 3 };
    const expected: i32 = 4;
    const actual = numIdenticalPairs(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
