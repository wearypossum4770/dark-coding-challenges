const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn stringIntegerIsBalanced(num: []const u8) bool {
    var even: usize = 0;
    var odd: usize = 0;
    for (num, 0..) |n, i| {
        const digit = n - '0';
        if (@mod(i, 2) == 0) {
            even += digit;
        } else {
            odd += digit;
        }
    }
    return even == odd;
}

test "summation of odd and even indices are equal in 12" {
    const num = "12";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 11" {
    const num = "11";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 1234" {
    const num = "1234";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 24123" {
    const num = "24123";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 00" {
    const num = "00";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 10" {
    const num = "10";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 1010" {
    const num = "1010";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 909" {
    const num = "909";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 1234567890" {
    const num = "1234567890";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 111111" {
    const num = "111111";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 123321" {
    const num = "123321";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 99999999" {
    const num = "99999999";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 5005" {
    const num = "5005";
    const expected = true;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 1234567" {
    const num = "1234567";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
test "summation of odd and even indices are equal in 1" {
    const num = "1";
    const expected = false;
    const actual = stringIntegerIsBalanced(num);
    try expectEqual(expected, actual);
}
