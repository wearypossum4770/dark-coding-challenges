const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn uglyNumber(n: i32) bool {
    if (n < 1) return false;
    var num = n;
    const primes = [3]i32{ 2, 3, 5 };
    for (primes) |prime| {
        while (@mod(num, prime) == 0) {
            num = @divFloor(num, prime);
        }
    }
    return num == 1;
}

test "validate uglyNumber(8)" {
    const n: i32 = 8;
    const expected: bool = true;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(6)" {
    const n: i32 = 6;
    const expected: bool = true;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(1)" {
    const n: i32 = 1;
    const expected: bool = true;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(14)" {
    const n: i32 = 14;
    const expected: bool = false;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(30)" {
    const n: i32 = 30;
    const expected: bool = true;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(0)" {
    const n: i32 = 0;
    const expected: bool = false;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
test "validate uglyNumber(-1)" {
    const n: i32 = -1;
    const expected: bool = false;
    const actual = uglyNumber(n);
    try expectEqual(expected, actual);
}
