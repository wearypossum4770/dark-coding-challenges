const expectEqual = @import("std").testing.expectEqual;

pub fn profitableGamble(probability: f32, prize: f32, cost: f32) bool {
    return probability * prize > cost;
}

test "Is the gamble profitable." {
    try expectEqual(profitableGamble(0.2, 50, 9), true);
    try expectEqual(profitableGamble(0.9, 1, 2), false);
    try expectEqual(profitableGamble(0.9, 3, 2), true);
    try expectEqual(profitableGamble(0.33, 10, 3.30), true);
    try expectEqual(profitableGamble(0, 1000, 0.01), false);
    try expectEqual(profitableGamble(0.1, 1000, 7), true);
    try expectEqual(profitableGamble(0, 0, 0), false);
}
