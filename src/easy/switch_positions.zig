const std = @import("std");
const expectEqual = std.testing.expectEqual;
const power = std.math.pow;

pub fn switchPositions(switches: u32) u32 {
    return power(u32, 2, switches);
}

test "Determine number of positions of 5 switches" {
    try expectEqual(switchPositions(5), 32);
}
test "Determine number of positions of 4 switches" {
    try expectEqual(switchPositions(4), 16);
}
test "Determine number of positions of 3 switches" {
    try expectEqual(switchPositions(3), 8);
}
test "Determine number of positions of 2 switches" {
    try expectEqual(switchPositions(2), 4);
}
test "Determine number of positions of 1 switches" {
    try expectEqual(switchPositions(1), 2);
}
test "Determine number of positions of 6 switches" {
    try expectEqual(switchPositions(6), 64);
}
test "Determine number of positions of 7 switches" {
    try expectEqual(switchPositions(7), 128);
}
test "Determine number of positions of 8 switches" {
    try expectEqual(switchPositions(8), 256);
}
test "Determine number of positions of 9 switches" {
    try expectEqual(switchPositions(9), 512);
}
test "Determine number of positions of 10 switches" {
    try expectEqual(switchPositions(10), 1024);
}
test "Determine number of positions of 25 switches" {
    try expectEqual(switchPositions(25), 33554432);
}
