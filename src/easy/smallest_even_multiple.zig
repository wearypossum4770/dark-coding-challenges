const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn smallestEvenMultiple(n: u32) u32 {
    if (@mod(n, 2) != 0) return n * 2;
    return n;
}

test "smallest even multple of 3" {
    const n: u32 = 3;
    const expected: u32 = 6;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 4" {
    const n: u32 = 4;
    const expected: u32 = 4;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 5" {
    const n: u32 = 5;
    const expected: u32 = 10;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 6" {
    const n: u32 = 6;
    const expected: u32 = 6;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 7" {
    const n: u32 = 7;
    const expected: u32 = 14;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 8" {
    const n: u32 = 8;
    const expected: u32 = 8;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 9" {
    const n: u32 = 9;
    const expected: u32 = 18;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 10" {
    const n: u32 = 10;
    const expected: u32 = 10;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 11" {
    const n: u32 = 11;
    const expected: u32 = 22;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 12" {
    const n: u32 = 12;
    const expected: u32 = 12;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 13" {
    const n: u32 = 13;
    const expected: u32 = 26;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 14" {
    const n: u32 = 14;
    const expected: u32 = 14;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 15" {
    const n: u32 = 15;
    const expected: u32 = 30;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 16" {
    const n: u32 = 16;
    const expected: u32 = 16;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 17" {
    const n: u32 = 17;
    const expected: u32 = 34;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 18" {
    const n: u32 = 18;
    const expected: u32 = 18;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 19" {
    const n: u32 = 19;
    const expected: u32 = 38;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 20" {
    const n: u32 = 20;
    const expected: u32 = 20;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}

test "smallest even multple of 1" {
    const n: u32 = 1;
    const expected: u32 = 2;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 2" {
    const n: u32 = 2;
    const expected: u32 = 2;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 150" {
    const n: u32 = 150;
    const expected: u32 = 150;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
test "smallest even multple of 149" {
    const n: u32 = 149;
    const expected: u32 = 298;
    const actual = smallestEvenMultiple(n);
    try expectEqual(expected, actual);
}
