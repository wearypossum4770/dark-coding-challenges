const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

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

test "day of the week for the date 31-8-2019" {
    const day: u64 = 31;
    const month: u64 = 8;
    const year: u64 = 2019;
    const expected = "Saturday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 18-7-1999" {
    const day: u64 = 18;
    const month: u64 = 7;
    const year: u64 = 1999;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 15-8-1993" {
    const day: u64 = 15;
    const month: u64 = 8;
    const year: u64 = 1993;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 29-2-2016" {
    const day: u64 = 29;
    const month: u64 = 2;
    const year: u64 = 2016;
    const expected = "Monday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-1-1971" {
    const day: u64 = 1;
    const month: u64 = 1;
    const year: u64 = 1971;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 31-12-1971" {
    const day: u64 = 31;
    const month: u64 = 12;
    const year: u64 = 1971;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-1-2100" {
    const day: u64 = 1;
    const month: u64 = 1;
    const year: u64 = 2100;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 31-12-2100" {
    const day: u64 = 31;
    const month: u64 = 12;
    const year: u64 = 2100;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 29-2-1972" {
    const day: u64 = 29;
    const month: u64 = 2;
    const year: u64 = 1972;
    const expected = "Tuesday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 29-2-2000" {
    const day: u64 = 29;
    const month: u64 = 2;
    const year: u64 = 2000;
    const expected = "Tuesday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-3-2100" {
    const day: u64 = 1;
    const month: u64 = 3;
    const year: u64 = 2100;
    const expected = "Monday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}

test "day of the week for the date 31-3-2020" {
    const day: u64 = 31;
    const month: u64 = 3;
    const year: u64 = 2020;
    const expected = "Tuesday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 28-2-2019" {
    const day: u64 = 28;
    const month: u64 = 2;
    const year: u64 = 2019;
    const expected = "Thursday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-3-2019" {
    const day: u64 = 1;
    const month: u64 = 3;
    const year: u64 = 2019;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 29-2-2020" {
    const day: u64 = 29;
    const month: u64 = 2;
    const year: u64 = 2020;
    const expected = "Saturday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-3-2020" {
    const day: u64 = 1;
    const month: u64 = 3;
    const year: u64 = 2020;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 4-7-1976" {
    const day: u64 = 4;
    const month: u64 = 7;
    const year: u64 = 1976;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}

test "day of the week for the date 11-9-2001" {
    const day: u64 = 11;
    const month: u64 = 9;
    const year: u64 = 2001;
    const expected = "Tuesday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 30-12-1999" {
    const day: u64 = 30;
    const month: u64 = 12;
    const year: u64 = 1999;
    const expected = "Thursday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 31-12-1999" {
    const day: u64 = 31;
    const month: u64 = 12;
    const year: u64 = 1999;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-1-2000" {
    const day: u64 = 1;
    const month: u64 = 1;
    const year: u64 = 2000;
    const expected = "Saturday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 30-4-2021" {
    const day: u64 = 30;
    const month: u64 = 4;
    const year: u64 = 2021;
    const expected = "Friday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 1-5-2021" {
    const day: u64 = 1;
    const month: u64 = 5;
    const year: u64 = 2021;
    const expected = "Saturday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 2-5-2021" {
    const day: u64 = 2;
    const month: u64 = 5;
    const year: u64 = 2021;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 10-10-2010" {
    const day: u64 = 10;
    const month: u64 = 10;
    const year: u64 = 2010;
    const expected = "Sunday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 14-2-2023" {
    const day: u64 = 14;
    const month: u64 = 2;
    const year: u64 = 2023;
    const expected = "Tuesday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
test "day of the week for the date 25-12-1995" {
    const day: u64 = 25;
    const month: u64 = 12;
    const year: u64 = 1995;
    const expected = "Monday";
    const actual = dayOfTheWeek(@TypeOf(day), day, month, year);
    try expectEqualStrings(expected, actual);
}
