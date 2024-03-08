const expectEqual = @import("std").testing.expectEqual;

pub fn hoursMinutesToSeconds(hours: i32, minutes: i32) i32 {
    return hours * 3_600 + 60 * minutes;
}
test "convert hours and minutes to seconds." {
    try expectEqual(hoursMinutesToSeconds(1, 0), 3_600);
    try expectEqual(hoursMinutesToSeconds(1, 3), 3_780);
    try expectEqual(hoursMinutesToSeconds(0, 30), 1_800);
}
