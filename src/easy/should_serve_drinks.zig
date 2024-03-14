const expectEqual = @import("std").testing.expectEqual;

pub fn shouldServeDrinks(age: i32, onBreak: bool) bool {
    if (age >= 18) {
        return !onBreak;
    }
    return false;
}
test "Can bartender serve drink" {
    try expectEqual(shouldServeDrinks(17, true), false);
    try expectEqual(shouldServeDrinks(30, true), false);
    try expectEqual(shouldServeDrinks(24, false), true);
    try expectEqual(shouldServeDrinks(18, false), true);
    try expectEqual(shouldServeDrinks(3, false), false);
}
