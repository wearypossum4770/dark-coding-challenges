const expect = @import("std").testing.expect;

pub fn triangleNextEdge(a: i32, b: i32) i32 {
    return a + b - 1;
}
test "integer subtraction" {
    try expect(triangleNextEdge(5, 4) == 8);
    try expect(triangleNextEdge(8, 3) == 10);
    try expect(triangleNextEdge(7, 9) == 15);
    try expect(triangleNextEdge(10, 4) == 13);
    try expect(triangleNextEdge(7, 2) == 8);
}
