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

test "if the number 1 is a power of 3" {
    const n: i32 = 1;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 3 is a power of 3" {
    const n: i64 = 3;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 9 is a power of 3" {
    const n: i64 = 9;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 27 is a power of 3" {
    const n: i64 = 27;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 81 is a power of 3" {
    const n: i64 = 81;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 243 is a power of 3" {
    const n: i64 = 243;
    const expected = true;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 2 is a power of 3" {
    const n: i64 = 2;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 4 is a power of 3" {
    const n: i64 = 4;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 6 is a power of 3" {
    const n: i64 = 6;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 10 is a power of 3" {
    const n: i64 = 10;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 12 is a power of 3" {
    const n: i64 = 12;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 100 is a power of 3" {
    const n: i64 = 100;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 0 is a power of 3" {
    const n: i64 = 0;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number -3 is a power of 3" {
    const n: i64 = -3;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number -27 is a power of 3" {
    const n: i64 = -27;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}

test "if the number 2147483647 is a power of 3" {
    const n: i64 = 2147483647;
    const expected = false;
    const actual = isPowerOfThree(@TypeOf(n), n);
    try expectEqual(expected, actual);
}
