const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn isPowerOfThree(comptime T: type, n: T) bool {
    if (n < 1) return false;
    var num = n;
    while (@mod(num, 3) == 0) {
        num = @divFloor(num, 3);
    }
    return num == 1;
}
