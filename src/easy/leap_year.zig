const std = @import("std");
const expect = std.testing.expect;

pub fn isLeapYear(year: i32) bool {
    if (@mod(year, 400) != 0 and @mod(year, 100) == 0) return false;
    return @mod(year, 4) == 0;
}

test "Determine if 1850 is a leap year" {
    try expect(!isLeapYear(1850));
}
test "Determine if 1565 is a leap year" {
    try expect(!isLeapYear(1565));
}
test "Determine if 1920 is a leap year" {
    try expect(isLeapYear(1920));
}
test "Determine if 1924 is a leap year" {
    try expect(isLeapYear(1924));
}
test "Determine if 1928 is a leap year" {
    try expect(isLeapYear(1928));
}
test "Determine if 1940 is a leap year" {
    try expect(isLeapYear(1940));
}
test "Determine if 2021 is a leap year" {
    try expect(!isLeapYear(2021));
}
test "Determine if 2004 is a leap year" {
    try expect(isLeapYear(2004));
}
test "Determine if 8 is a leap year" {
    try expect(isLeapYear(8));
}
test "Determine if 4 is a leap year" {
    try expect(isLeapYear(4));
}
test "Determine if 2019 is a leap year" {
    try expect(!isLeapYear(2019));
}
test "Determine if 1970 is a leap year" {
    try expect(!isLeapYear(1970));
}
test "Determine if 1934 is a leap year" {
    try expect(!isLeapYear(1934));
}
test "Determine if 1874 is a leap year" {
    try expect(!isLeapYear(1874));
}
test "Determine if 1968 is a leap year" {
    try expect(isLeapYear(1968));
}

test "year not divisible by 4 in common year" {
    try expect(!isLeapYear(2015));
}

test "year divisible by 2, not divisible by 4 in common year" {
    try expect(!isLeapYear(1970));
}

test "year divisible by 4, not divisible by 100 in leap year" {
    try expect(isLeapYear(1996));
}

test "year divisible by 4 and 5 is still a leap year" {
    try expect(isLeapYear(1960));
}

test "year divisible by 100, not divisible by 400 in common year" {
    try expect(!isLeapYear(2100));
}

test "year divisible by 100 but not by 3 is still not a leap year" {
    try expect(!isLeapYear(1900));
}

test "year divisible by 400 is leap year" {
    try expect(isLeapYear(2000));
}

test "year divisible by 400 but not by 125 is still a leap year" {
    try expect(isLeapYear(2400));
}

test "year divisible by 200, not divisible by 400 in common year" {
    try expect(!isLeapYear(1800));
}
