const expectEqual = @import("std").testing.expectEqual;

pub fn lessThanOrEqualToZero(number: i32) bool {
    return number <= 0;
}
test "Is 5 less than or equal to zero " {
    try expectEqual(lessThanOrEqualToZero(5), false);
}
test "Is 0 less than or equal to zero " {
    try expectEqual(lessThanOrEqualToZero(0), true);
}
test "Is -5 less than or equal to zero " {
    try expectEqual(lessThanOrEqualToZero(-5), true);
}
