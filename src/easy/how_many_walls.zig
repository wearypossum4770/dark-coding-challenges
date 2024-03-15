const std = @import("std");
const expectEqual = std.testing.expectEqual;

pub fn howManyWalls(walls: u32, width: u32, height: u32) u32 {
    const total: u32 = height * width;
    if (total <= walls) {
        return @divFloor(walls, total);
    }
    return 0;
}
test "Determine how many m² can be painted" {
    try expectEqual(howManyWalls(100, 4, 5), 5);
    try expectEqual(howManyWalls(10, 15, 12), 0);
    try expectEqual(howManyWalls(41, 3, 6), 2);
    try expectEqual(howManyWalls(50, 11, 5), 0);
    try expectEqual(howManyWalls(1, 1, 1), 1);
}
