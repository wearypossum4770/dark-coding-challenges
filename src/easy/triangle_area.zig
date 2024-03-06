const expect = @import("std").testing.expect;

pub fn triangleArea(base: i32, height: i32) i32 {
    const squareArea: i32 = base * height;
    return @divExact(squareArea, 2);
}
test "integer subtraction" {
    try expect(triangleArea(3, 2) == 3);
    try expect(triangleArea(5, 4) == 10);
    try expect(triangleArea(10, 10) == 50);
    try expect(triangleArea(0, 60) == 0);
    try expect(triangleArea(12, 11) == 66);
}
