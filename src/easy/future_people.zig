const expectEqual = @import("std").testing.expectEqual;

pub fn futurePeople(population: i32, births: i32) i32 {
    return population + 360 * births;
}
test "Calculate population after 30 years" {
    try expectEqual(futurePeople(256, 2), 976);
    try expectEqual(futurePeople(3248, 6), 5408);
    try expectEqual(futurePeople(5240, 3), 6320);
}
