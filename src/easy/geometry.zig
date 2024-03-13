const expectEqual = @import("std").testing.expectEqual;

pub fn geometry(length: i32, width: i32) i32 {
    if (length > 0 and width > 0) {
        return length * width;
    }
    return -1;
}
test "find valid rectangle area" {
    try expectEqual(geometry(5, 3), 15);
    try expectEqual(geometry(8, 5), 40);
    try expectEqual(geometry(5, 4), 20);
    try expectEqual(geometry(2, 3), 6);
    try expectEqual(geometry(10000, 10000), 100000000);
    try expectEqual(geometry(-2, -5), -1);
    try expectEqual(geometry(0, 3), -1);
    try expectEqual(geometry(5, -3), -1);
    try expectEqual(geometry(0, 1), -1);
    try expectEqual(geometry(-1, 0), -1);
}
