const expectEqual = @import("std").testing.expectEqual;

// @copyright https://edabit.com/challenge/8q54MKnRrm89pSLmW
pub fn minutesToSeconds(minutes: i32) i32 {
    return minutes * 60;
}
test "Convert 6 minutes to seconds" {
    try expectEqual(minutesToSeconds(6), 360);
}
test "Convert 4 minutes to seconds" {
    try expectEqual(minutesToSeconds(4), 240);
}
test "Convert 8 minutes to seconds" {
    try expectEqual(minutesToSeconds(8), 480);
}
test "Convert 60 minutes to seconds" {
    try expectEqual(minutesToSeconds(60), 3600);
}
