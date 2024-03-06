const expect = @import("std").testing.expect;

// @copyright https://edabit.com/challenge/8q54MKnRrm89pSLmW
pub fn minutesToSeconds(minutes: i32) i32 {
    return minutes * 60;
}
test "integer subtraction" {
    try expect(minutesToSeconds(6) == 360);
    try expect(minutesToSeconds(4) == 240);
    try expect(minutesToSeconds(8) == 480);
    try expect(minutesToSeconds(60) == 3600);
}
