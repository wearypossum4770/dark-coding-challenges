const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn findEvenDigitNumbers(comptime T: type, nums: []const T) usize {
    var result: usize = 0;
    for (nums) |num| {
        var length: usize = 0;
        var size = num;
        while (size > 0) : (length += 1) {
            size = @divFloor(size, 10);
        }
        if (length % 2 == 0) {
            result += 1;
        }
    }
    return result;
}

test "tally the even length numbers in [12,345,2,6,7896]" {
    const nums = [_]i32{ 12, 345, 2, 6, 7896 };
    const expected: usize = 2;
    const actual = findEvenDigitNumbers(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
test "tally the even length numbers in [555,901,482,1771]" {
    const nums = [_]i32{ 555, 901, 482, 1771 };
    const expected: usize = 1;
    const actual = findEvenDigitNumbers(@TypeOf(nums[0]), &nums);
    try expectEqual(expected, actual);
}
