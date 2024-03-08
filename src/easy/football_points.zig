const expectEqual = @import("std").testing.expectEqual;

pub fn footballPoints(wins: u32, draws: u32, losses: u32) u32 {
    _ = losses;
    return 3 * wins + draws;
}
test "Calculate football points" {
    try expectEqual(footballPoints(1, 2, 3), 5);
    try expectEqual(footballPoints(5, 5, 5), 20);
    try expectEqual(footballPoints(1, 0, 0), 3);
    try expectEqual(footballPoints(0, 7, 0), 7);
    try expectEqual(footballPoints(0, 0, 15), 0);
}
