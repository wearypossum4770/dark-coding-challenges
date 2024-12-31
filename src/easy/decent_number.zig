const std = @import("std");
const expect = std.testing.expect;
const mem = std.mem;
const fmt = std.fmt;

const expectEqual = std.testing.expectEqual;

pub fn decentNumber(n: usize) ?[]u8 {
    var fives: usize = n;
    while (@mod(fives, 3) != 0) {
        fives -= 5;
    }
    if (fives < 0) return null;
    var result = std.ArrayList(u8).init(std.heap.page_allocator);
    defer result.deinit();
    try result.ensureTotalCapacity(fives + (n - fives));
    for (fives) |_| {
        try result.append('5');
    }
    for (n - fives) |_| {
        try result.append('3');
    }
    return result.toOwnedSlice();
}
test "Determine if 1 is a decent number" {
    try expect(mem.eql(u8, decentNumber(1), "-1"));
}
test "Determine if 2 is a decent number" {
    try expect(mem.eql(u8, decentNumber(2), "-1"));
}
test "Determine if 3 is a decent number" {
    const size = 3;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    const output = "555";
    try expect(mem.eql(u8, result, output));
}
test "Determine if 4 is a decent number" {
    const output = "-1";
    const size = 4;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 5 is a decent number" {
    const output = "33333";
    const size = 5;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 6 is a decent number" {
    const output = "555555";
    const size = 6;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 7 is a decent number" {
    const result = decentNumber(7) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, "-1"));
}
test "Determine if 10 is a decent number" {
    const output = "3333333333";
    const size = 10;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 11 is a decent number" {
    const output = "55555533333";
    const size = 11;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 13 is a decent number" {
    const output = "5553333333333";
    const size = 13;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 14 is a decent number" {
    const output = "55555555533333";
    const size = 14;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
test "Determine if 15 is a decent number" {
    const output = "555555555555555";
    const size = 15;
    const result = decentNumber(size) orelse return std.testing.expect(false);
    try expect(mem.eql(u8, result, output));
}
// test "Determine if 20 is a decent number" {
//     const FIVES: []const u8 = "5" ** 15;
//     const THREES: []const u8 = '3' ** 5;
//     const output: [18]u8 = undefined;
//     try expect(mem.eql(u8, decentNumber(20), OUTPUT));
// }
// test "Determine if 30 is a decent number" {
//     const FIVES: []const u8 = "5" ** 30;
//     try expect(mem.eql(u8, decentNumber(30), OUTPUT));
// }
// test "Determine if 50 is a decent number" {
//     const FIVES: []const u8 = "5" ** 45;
//     const THREES: []const u8 = '3' ** 5;
//     try expect(mem.eql(u8, decentNumber(50), OUTPUT));
// }
// test "Determine if 1_000_000 is a decent number" {
//     const FIVES: []const u8 = "5" ** 999990;
//     const THREES: []const u8 = "3" ** 10;
//     try expect(mem.eql(u8, decentNumber(1_000_000), OUTPUT));
// }
// test "Determine if 2194 is a decent number" {
//     const FIVES: []const u8 = "5" ** 2184;
//     const THREES: []const u8 = "3" ** 10;
//     try expect(mem.eql(u8, decentNumber(2194), OUTPUT));
// }
// test "Determine if 12002 is a decent number" {
//     const FIVES: []const u8 = "5" ** 11997;
//     const THREES: []const u8 = "3" ** 5;
//     try expect(mem.eql(u8, decentNumber(12002), OUTPUT));
// }
// test "Determine if 21965 is a decent number" {
//     const FIVES: []const u8 = "5" ** 21960;
//     const THREES: []const u8 = "3" ** 5;
//     try expect(mem.eql(u8, decentNumber(21965), OUTPUT));
// }
// test "Determine if 55140 is a decent number" {
//     const FIVES: []const u8 = "5" ** 55140;
//     const THREES: []const u8 = "3" ** 0;
//     try expect(mem.eql(u8, decentNumber(55140), OUTPUT));
// }
// test "Determine if 57634 is a decent number" {
//     const FIVES: []const u8 = "5" ** 57624;
//     const THREES: []const u8 = "3" ** 10;
//     try expect(mem.eql(u8, decentNumber(57634), OUTPUT));
// }
// test "Determine if 72574 is a decent number" {
//     const FIVES: []const u8 = "5" ** 72564;
//     const THREES: []const u8 = "3" ** 10;
//     try expect(mem.eql(u8, decentNumber(72574), OUTPUT));
// }
// test "Determine if 97624 is a decent number" {
//     const FIVES: []const u8 = "5" ** 97614;
//     const THREES: []const u8 = "3" ** 10;
//     try expect(mem.eql(u8, decentNumber(97624), OUTPUT));
// }
// test "Determine if 22881 is a decent number" {
//     const FIVES: []const u8 = "5" ** 22881;
//     const THREES: []const u8 = "3" ** 0;
//     try expect(mem.eql(u8, decentNumber(22881), OUTPUT));
// }
// test "Determine if 52292 is a decent number" {
//     const FIVES: []const u8 = "5" ** 52287;
//     const THREES: []const u8 = "3" ** 5;
//     try expect(mem.eql(u8, decentNumber(52292), OUTPUT));
// }
// test "Determine if 1650 is a decent number" {
//     const FIVES: []const u8 = "5" ** 1650;
//     const THREES: []const u8 = "3" ** 0;
//     try expect(mem.eql(u8, decentNumber(1650), OUTPUT));
// }
