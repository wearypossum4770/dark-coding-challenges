const expectEqual = @import("std").testing.expectEqual;

pub fn triangleNextEdge(a: i32, b: i32) i32 {
    return a + b - 1;
}
test "Find next edge of a triangle with sides [5 4]" {
    try expectEqual(triangleNextEdge(5, 4), 8);
}
test "Find next edge of a triangle with sides [8 3]" {
    try expectEqual(triangleNextEdge(8, 3), 10);
}
test "Find next edge of a triangle with sides [7 9]" {
    try expectEqual(triangleNextEdge(7, 9), 15);
}
test "Find next edge of a triangle with sides [10 4]" {
    try expectEqual(triangleNextEdge(10, 4), 13);
}
test "Find next edge of a triangle with sides [7 2]" {
    try expectEqual(triangleNextEdge(7, 2), 8);
}
