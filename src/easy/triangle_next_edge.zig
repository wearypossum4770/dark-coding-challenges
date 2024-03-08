const expectEqual = @import("std").testing.expectEqual;

pub fn triangleNextEdge(a: i32, b: i32) i32 {
    return a + b - 1;
}
test "integer subtraction" {
    try expectEqual(triangleNextEdge(5, 4), 8);
    try expectEqual(triangleNextEdge(8, 3), 10);
    try expectEqual(triangleNextEdge(7, 9), 15);
    try expectEqual(triangleNextEdge(10, 4), 13);
    try expectEqual(triangleNextEdge(7, 2), 8);
}
