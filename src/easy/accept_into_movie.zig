const expectEqual = @import("std").testing.expectEqual;

pub fn acceptIntoMovie(age: f32, isSupervised: bool) bool {
    if (age < 15) {
        return isSupervised;
    }
    return true;
}
test "Movie Theatre Admittance" {
    try expectEqual(acceptIntoMovie(14, true), true);
    try expectEqual(acceptIntoMovie(15, true), true);
    try expectEqual(acceptIntoMovie(16, true), true);
    try expectEqual(acceptIntoMovie(14, false), false);
    try expectEqual(acceptIntoMovie(15, false), true);
    try expectEqual(acceptIntoMovie(16, false), true);
    try expectEqual(acceptIntoMovie(14.99999, true), true);
    try expectEqual(acceptIntoMovie(14.99999, false), false);
}
