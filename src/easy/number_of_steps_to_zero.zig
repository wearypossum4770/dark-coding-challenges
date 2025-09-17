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

test "number of steps to reduce 14" {
    const num: i32 = 14;
    const expected: usize = 6;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 8" {
    const num: i32 = 8;
    const expected: usize = 4;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 123" {
    const num: i32 = 123;
    const expected: usize = 12;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 0" {
    const num: i32 = 0;
    const expected: usize = 0;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 1" {
    const num: i32 = 1;
    const expected: usize = 1;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 1000000" {
    const num: i32 = 1_000_000;
    const expected: usize = 26;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce negative input" {
    const num: i32 = -1;
    const expected: usize = 0;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}

test "number of steps to reduce 999999" {
    const num: i32 = 999_999;
    const expected: usize = 31;
    const actual = numberOfStepsToZero(num);
    try expectEqual(expected, actual);
}
