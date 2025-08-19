const std = @import("std");

pub fn happyBirthday(date: []const u8) []const u8 {
    if (std.mem.eql(u8, date, "18")) return "Happy Birthday!";
    return "Just a normal day!";
}

test "Happy Birthday!" {
    const date = "18";
    const expected = "Happy Birthday!";
    const actual = happyBirthday(date);
    try std.testing.expectEqualSlices(u8, expected, actual);
}
test "Just a normal day!" {
    const date = "";
    const expected = "Just a normal day!";
    const actual = happyBirthday(date);
    try std.testing.expectEqualSlices(u8, expected, actual);
}
