const std = @import("std");
const expectEqual = std.testing.expectEqual;
const power = std.math.pow;

pub fn switchPositions(switches: u32) u32 {
    return power(u32, 2, switches);
}
test "Determine number of positioon of switches" {
    try expectEqual(switchPositions(5), 32);
    try expectEqual(switchPositions(4), 16);
    try expectEqual(switchPositions(3), 8);
    try expectEqual(switchPositions(2), 4);
    try expectEqual(switchPositions(1), 2);
    try expectEqual(switchPositions(6), 64);
    try expectEqual(switchPositions(7), 128);
    try expectEqual(switchPositions(8), 256);
    try expectEqual(switchPositions(9), 512);
    try expectEqual(switchPositions(10), 1024);
    try expectEqual(switchPositions(25), 33554432);
}
