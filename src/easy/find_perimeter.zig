const expectEqual = @import("std").testing.expectEqual;

pub fn findPerimeter(length: i32, width: i32) i32 {
    return 2 * (length + width);
}
test "integer subtraction" {
    try expectEqual(findPerimeter(6, 7), 26);
    try expectEqual(findPerimeter(20, 10), 60);
    try expectEqual(findPerimeter(2, 9), 22);
}
