const expectEqual = @import("std").testing.expectEqual;
const pow = @import("std").math.pow;
pub fn cubedNumber(number: i32) i32 {
    return pow(i32, number, 3);
}
pub fn calculateExponent(base: i32, exponent: i32) i64 {
    return pow(i64, base, exponent);
}
test "raising a number to a power" {
    try expectEqual(calculateExponent(5, 5), 3125);
    try expectEqual(calculateExponent(3, 3), 27);
    try expectEqual(calculateExponent(10, 10), 10000000000);
}
test "cubed numbers" {
    try expectEqual(cubedNumber(2), 8);
    try expectEqual(cubedNumber(3), 27);
    try expectEqual(cubedNumber(4), 64);
    try expectEqual(cubedNumber(5), 125);
    try expectEqual(cubedNumber(10), 1000);
}
