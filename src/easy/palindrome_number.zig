const std = @import("std");
const expect = std.testing.expect;
const textTools = @import("./text_tools.zig");

pub fn palindromeNumber(param: i32) bool {
    if (param < 0 or @mod(param, 10) == 0 and param != 0) return false;
    const number = textTools.numberString(i32, param);
    var right = number.len - 1;
    for (number) |num| {
        if (num != number[right]) {
            return false;
        }
        if (right == 0) {
            break;
        }
        right -= 1;
    }
    return true;
}
test "Scenario: negative numbers cannot be palindromic" {
    try expect(!palindromeNumber(-121));
    try expect(!palindromeNumber(-101));
    try expect(!palindromeNumber(-10));
    try expect(!palindromeNumber(-1));
    try expect(!palindromeNumber(-101));
}
test "Scenario: zero is a palindrome" {
    try expect(palindromeNumber(0));
}
test "Scenario: single digit numbers are palindromic" {
    try expect(palindromeNumber(1));
    try expect(palindromeNumber(3));
    try expect(palindromeNumber(8));
    try expect(palindromeNumber(9));
}
test "Scenario: double digit numbers not duplicate numbers are not palindromic" {
    try expect(!palindromeNumber(10));
}

test "Scenario: duplicated double digit numbers are palindromic" {
    try expect(palindromeNumber(11));
}
test "Scenario: higher order numbers possibly palindromic" {
    try expect(!palindromeNumber(100));
    try expect(palindromeNumber(121));
    try expect(!palindromeNumber(123));
    try expect(palindromeNumber(313));
    try expect(!palindromeNumber(1000030001));
}
