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
