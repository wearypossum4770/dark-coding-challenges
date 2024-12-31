const std = @import("std");
const testing = std.testing;
const expectEqualStrings = testing.expectEqualStrings;
pub fn raindrops(buffer: []u8, drop: u32) []const u8 {
    var result = buffer; // Adjust the buffer size as needed
    var idx: usize = 0;

    const divisibleByThree = @rem(drop, 3) == 0;
    const divisibleByFive = @rem(drop, 5) == 0;
    const divisibleBySeven = @rem(drop, 7) == 0;
    if (divisibleByThree) {
        idx += 5;
        std.mem.copy(u8, result[idx..], "Pling");
    }
    if (divisibleByFive) {
        idx += 5;
        std.mem.copy(u8, result[idx..], "Plang");
    }
    if (divisibleBySeven) {
        idx += 5;
        std.mem.copy(u8, result[idx..], "Plong");
    }
    if (idx == 0) {
        const bytes = std.mem.toBytes(&drop);
        std.mem.copy(u8, result[idx..], &bytes);
    }
    return result[0..idx];
}

fn testConvert(comptime n: u32, expected: []const u8) !void {
    const buffer_size = 15; // The maximum length is for PlingPlangPlong
    var buffer: [buffer_size]u8 = undefined;
    const actual = raindrops(&buffer, n);
    try std.mem.eql(u8, expected, actual);
}
test "converts 1" {
    try testConvert(1, "1");
}
test "converts 3" {
    try testConvert(3, "Pling");
}
test "converts 5" {
    try testConvert(5, "Plang");
}
test "converts 7" {
    try testConvert(7, "Plong");
}
test "converts 6" {
    try testConvert(6, "Pling");
}
test "converts 9" {
    try testConvert(9, "Pling");
}
test "converts 10" {
    try testConvert(10, "Plang");
}
test "converts 14" {
    try testConvert(14, "Plong");
}
test "converts 15" {
    try testConvert(15, "PlingPlang");
}
test "converts 21" {
    try testConvert(21, "PlingPlong");
}
test "converts 25" {
    try testConvert(25, "Plang");
}
test "converts 35" {
    try testConvert(35, "PlangPlong");
}
test "converts 49" {
    try testConvert(49, "Plong");
}
test "converts 52" {
    try testConvert(52, "52");
}
test "converts 105" {
    try testConvert(105, "PlingPlangPlong");
}
test "converts 12121" {
    try testConvert(12121, "12121");
}
