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

test "sum of multiples of 3/5/7 until 1" {
    const num: usize = 1;
    const expected: u32 = 0;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 2" {
    const num: usize = 2;
    const expected: u32 = 0;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 3" {
    const num: usize = 3;
    const expected: u32 = 3;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 5" {
    const num: usize = 5;
    const expected: u32 = 8;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 7" {
    const num: usize = 7;
    const expected: u32 = 21;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 9" {
    const num: usize = 9;
    const expected: u32 = 30;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 10" {
    const num: usize = 10;
    const expected: u32 = 40;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 12" {
    const num: usize = 12;
    const expected: u32 = 52;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 15" {
    const num: usize = 15;
    const expected: u32 = 81;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 20" {
    const num: usize = 20;
    const expected: u32 = 119;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 21" {
    const num: usize = 21;
    const expected: u32 = 140;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 50" {
    const num: usize = 50;
    const expected: u32 = 691;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 100" {
    const num: usize = 100;
    const expected: u32 = 2_838;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 1_000" {
    const num: usize = 1_000;
    const expected: u32 = 272_066;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
test "sum of multiples of 3/5/7 until 200" {
    const num: usize = 200;
    const expected: u32 = 10_845;
    const actual = sumOfMultiples(@TypeOf(expected), num);
    try expectEqual(expected, actual);
}
