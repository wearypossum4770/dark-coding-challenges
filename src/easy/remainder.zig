const expect = @import("std").testing.expect;

pub fn remainder(a: i32, b: i32) i32 {
    return @rem(a, b);
}
test "integer subtraction" {
    try expect(remainder(7, 2) == 1);
    try expect(remainder(3, 4) == 3);
    try expect(remainder(-9, 45) == -9);
    try expect(remainder(5, 5) == 0);
}
