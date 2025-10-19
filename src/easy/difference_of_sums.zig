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

test "sum of divisibility of 3  in range [1,10]" {
    const n: i32 = 10;
    const m: i32 = 3;
    const expected: i32 = 19;
    const actual = differenceOfSums(n, m);
    try expectEqual(expected, actual);
}

test "sum of divisibility of 1  in range [1, 5]" {
    const n: i32 = 5;
    const m: i32 = 1;
    const expected: i32 = -15;
    const actual = differenceOfSums(n, m);
    try expectEqual(expected, actual);
}

test "sum of divisibility of 6 in range  [1, 5]" {
    const n: i32 = 5;
    const m: i32 = 6;
    const expected: i32 = 15;
    const actual = differenceOfSums(n, m);
    try expectEqual(expected, actual);
}
