const expectEqual = @import("std").testing.expectEqual;

pub fn farmAnimals(chickens: u32, cows: u32, pigs: u32) u32 {
    return 4 * (cows + pigs) + 2 * chickens;
}
test "The farm problem" {
    try expectEqual(farmAnimals(5, 2, 8), 50);
    try expectEqual(farmAnimals(3, 4, 7), 50);
    try expectEqual(farmAnimals(1, 2, 3), 22);
    try expectEqual(farmAnimals(3, 5, 2), 34);
}
