const expect = @import("std").testing.expect;
const pow = @import("std").math.pow;
pub fn cubedNumber(number: i32) i32 {
    return pow(i32, number, 3);
}
test "integer subtraction" {
    try expect(cubedNumber(2) == 8);
    try expect(cubedNumber(3) == 27);
    try expect(cubedNumber(4) == 64);
    try expect(cubedNumber(5) == 125);
    try expect(cubedNumber(10) == 1000);
}
