const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn differenceOfSums(n: i32, m: i32) i32 {
    var lhs: i32 = 0;
    var rhs: i32 = 0;
    const stop: usize = @intCast(n);
    for (1..stop + 1) |i| {
        const num: i32 = @intCast(i);
        if (@mod(num, m) == 0) {
            rhs += num;
        } else {
            lhs += num;
        }
    }
    return lhs - rhs;
}
