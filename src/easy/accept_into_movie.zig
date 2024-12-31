const expectEqual = @import("std").testing.expectEqual;

pub fn acceptIntoMovie(age: f32, isSupervised: bool) bool {
    if (age < 15) return isSupervised;
    return true;
}
test "Given age = 14 and isSupervised = true should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(14, true), true);
}
test "Given age = 15 and isSupervised = true should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(15, true), true);
}
test "Given age = 16 and isSupervised = true should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(16, true), true);
}
test "Given age = 14 and isSupervised = false should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(14, false), false);
}
test "Given age = 15 and isSupervised = false should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(15, false), true);
}
test "Given age = 16 and isSupervised = false should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(16, false), true);
}
test "Given age = 14.99999 and isSupervised = true should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(14.99999, true), true);
}
test "Given age = 14.99999 and isSupervised = false should admit into Movie Theatre" {
    try expectEqual(acceptIntoMovie(14.99999, false), false);
}
