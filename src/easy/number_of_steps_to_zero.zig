const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn numberOfStepsToZero(num: i32) usize {
    if (num < 0) return 0;
    var steps: usize = 0;
    var n = num;

    while (n > 0) : (steps += 1) {
        if (@mod(n, 2) == 0) {
            n = @divFloor(n, 2);
        } else {
            n -= 1;
        }
    }
    return steps;
}
