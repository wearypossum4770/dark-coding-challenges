const std = @import("std");

pub fn happyBirthday(date: []const u8) []const u8 {
    if (std.mem.eql(u8, date, "18")) return "Happy Birthday!";
    return "Just a normal day!";
}
