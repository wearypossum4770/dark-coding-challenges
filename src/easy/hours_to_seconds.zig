const expect = @import("std").testing.expect;

pub fn hoursToSeconds(hours: i32) i32 {
    return hours * 3_600;
}
test "integer subtraction" {
    try expect(hoursToSeconds(2) == 7200);
    try expect(hoursToSeconds(10) == 36000);
    try expect(hoursToSeconds(24) == 86400);
    try expect(hoursToSeconds(36) == 129600);
}
