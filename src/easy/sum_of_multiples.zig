const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn sumOfMultiples(comptime T: type, n: T) T {
    var total: T = 0;
    for (1..n + 1) |index| {
        const num: T = @intCast(index);
        if (@mod(num, 3) == 0 or @mod(num, 5) == 0 or @mod(num, 7) == 0) {
            total += num;
        }
    }
    return total;
}
