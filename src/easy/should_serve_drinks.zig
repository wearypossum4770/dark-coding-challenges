const expectEqual = @import("std").testing.expectEqual;

pub fn shouldServeDrinks(age: i32, onBreak: bool) bool {
    if (age >= 18) return !onBreak;
    return false;
}
test "Can a bartender serve a drink to a perons aged: 17 if they are on break <true>" {
    try expectEqual(shouldServeDrinks(17, true), false);
}
test "Can a bartender serve a drink to a perons aged: 30 if they are on break <true>" {
    try expectEqual(shouldServeDrinks(30, true), false);
}
test "Can a bartender serve a drink to a perons aged: 24 if they are on break <false>" {
    try expectEqual(shouldServeDrinks(24, false), true);
}
test "Can a bartender serve a drink to a perons aged: 18 if they are on break <false>" {
    try expectEqual(shouldServeDrinks(18, false), true);
}
test "Can a bartender serve a drink to a perons aged: 3 if they are on break <false>" {
    try expectEqual(shouldServeDrinks(3, false), false);
}
