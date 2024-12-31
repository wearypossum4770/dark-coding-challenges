const std = @import("std");
const expectEqual = @import("std").testing.expectEqual;

pub fn giveMeSomething(word: []const u8) ![*]const u8 {
    var buf: [100]u8 = undefined;
    const sentinel: u8 = 0;
    var buf_slice: [:0]u8 = try std.fmt.bufPrint(&buf, "something {s}", .{word});
    return try buf_slice ++ &sentinel;
    // Position Id: 01520-0012915274

}
test "integer subtraction" {
    try expectEqual(giveMeSomething("a"), "something a");
    try expectEqual(giveMeSomething("is cooking"), "something is cooking");
    try expectEqual(giveMeSomething(" is cooking"), "something  is cooking");
}
