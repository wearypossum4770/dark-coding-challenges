const expectEqual = @import("std").testing.expectEqual;

pub fn basketballPoints(two_points: i32, three_points: i32) i32 {
    return two_points * 2 + 3 * three_points;
}
test "basketball scores" {
    try expectEqual(basketballPoints(1, 1), 5);
    try expectEqual(basketballPoints(1, 2), 8);
    try expectEqual(basketballPoints(2, 1), 7);
    try expectEqual(basketballPoints(2, 2), 10);
    try expectEqual(basketballPoints(69, 420), 1398);
}
