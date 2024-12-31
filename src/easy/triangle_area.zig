const expectEqual = @import("std").testing.expectEqual;

pub fn triangleArea(base: i32, height: i32) i32 {
    return @divExact(base * height, 2);
}
test "Find area of a triangle with a base 3 and height 2" {
    try expectEqual(triangleArea(3, 2), 3);
}
test "Find area of a triangle with a base 5 and height 4" {
    try expectEqual(triangleArea(5, 4), 10);
}
test "Find area of a triangle with a base 10 and height 10" {
    try expectEqual(triangleArea(10, 10), 50);
}
test "Find area of a triangle with a base 0 and height 60" {
    try expectEqual(triangleArea(0, 60), 0);
}
test "Find area of a triangle with a base 12 and height 11" {
    try expectEqual(triangleArea(12, 11), 66);
}
