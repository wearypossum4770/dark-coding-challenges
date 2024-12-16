const std = @import("std");
const pow = std.math.pow;
const print = std.debug.print;
const expectEqual = std.testing.expectEqual;

pub fn squareOfSum(number: usize) usize {
    if (number == 0) return 0;
    var output: u64 = 0;
    for (0..number + 1) |i| {
        output += i;
    }
    return pow(u64, output, 2);
}

pub fn sumOfSquares(number: usize) usize {
    if (number == 0) return 0;
    var count: u64 = 0;
    for (0..number + 1) |i| {
        count += pow(u64, i, 2);
    }

    return count;
}
pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

test "square of sum up to 1" {
    const expected: usize = 1;
    const actual = squareOfSum(1);
    try expectEqual(expected, actual);
}

test "square of sum up to 5" {
    const expected: usize = 225;
    const actual = squareOfSum(5);
    try expectEqual(expected, actual);
}

test "square of sum up to 100" {
    const expected: usize = 25_502_500;
    const actual = squareOfSum(100);
    try expectEqual(expected, actual);
}

test "sum of squares up to 1" {
    const expected: usize = 1;
    const actual = sumOfSquares(1);
    try expectEqual(expected, actual);
}

test "sum of squares up to 5" {
    const expected: usize = 55;
    const actual = sumOfSquares(5);
    try expectEqual(expected, actual);
}

test "sum of squares up to 100" {
    const expected: usize = 338_350;
    const actual = sumOfSquares(100);
    try expectEqual(expected, actual);
}

test "difference of squares up to 1" {
    const expected: usize = 0;
    const actual = differenceOfSquares(1);
    try expectEqual(expected, actual);
}

test "difference of squares up to 5" {
    const expected: usize = 170;
    const actual = differenceOfSquares(5);
    try expectEqual(expected, actual);
}

test "difference of squares up to 100" {
    const expected: usize = 25_164_150;
    const actual = differenceOfSquares(100);
    try expectEqual(expected, actual);
}
