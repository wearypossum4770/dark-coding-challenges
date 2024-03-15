const expectEqual = @import("std").testing.expectEqual;

pub fn leapYear(year: i32) bool {
    if (@mod(year, 4) != 0) return false;
    if (@mod(year, 400) != 0 and @mod(year, 100) == 0) return false;
    return true;
}

test "Determine if 1850 is a leap year" {
    try expectEqual(leapYear(1850), false);
}
test "Determine if 1565 is a leap year" {
    try expectEqual(leapYear(1565), false);
}
test "Determine if 1920 is a leap year" {
    try expectEqual(leapYear(1920), true);
}
test "Determine if 1924 is a leap year" {
    try expectEqual(leapYear(1924), true);
}
test "Determine if 1928 is a leap year" {
    try expectEqual(leapYear(1928), true);
}
test "Determine if 1940 is a leap year" {
    try expectEqual(leapYear(1940), true);
}
test "Determine if 2021 is a leap year" {
    try expectEqual(leapYear(2021), false);
}
test "Determine if 2004 is a leap year" {
    try expectEqual(leapYear(2004), true);
}
test "Determine if 8 is a leap year" {
    try expectEqual(leapYear(8), true);
}
test "Determine if 4 is a leap year" {
    try expectEqual(leapYear(4), true);
}
test "Determine if 2019 is a leap year" {
    try expectEqual(leapYear(2019), false);
}
test "Determine if 1970 is a leap year" {
    try expectEqual(leapYear(1970), false);
}
test "Determine if 1934 is a leap year" {
    try expectEqual(leapYear(1934), false);
}
test "Determine if 1874 is a leap year" {
    try expectEqual(leapYear(1874), false);
}
test "Determine if 1968 is a leap year" {
    try expectEqual(leapYear(1968), true);
}
