const std = @import("std");

pub fn getDayOfWeekName(comptime T: type, index: T) ?[]const u8 {
    return switch (index) {
        0 => "Sunday",
        1 => "Monday",
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
        5 => "Friday",
        6 => "Saturday",
        else => null,
    };
}
pub fn dayOfTheWeek(comptime T: type, day: T, month: T, year: T) []const u8 {
    const offset = [_]T{ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };

    var y = year;
    if (month < 3) {
        y -= 1;
    }

    const m: usize = @intCast(month);
    const index: usize = @intCast(y +
        @divTrunc(y, 4) -
        @divTrunc(y, 100) +
        @divTrunc(y, 400) +
        offset[m - 1] +
        day);

    return getDayOfWeekName(T, @mod(index, 7)) orelse "Invalid";
}
