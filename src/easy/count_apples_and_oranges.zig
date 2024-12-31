const expectEqual = @import("std").testing.expectEqual;

pub fn countApplesAndOranges(minuend: i32, subtrahend: i32) i32 {
    return minuend - subtrahend;
}
test "count 🍎 & 🍊 fall from 🌳 and roll into 🏡" {
    try expectEqual(countApplesAndOranges(7, 10, 4, 12, 0, 0, [*]i32{ 2, 3, -4 }, [*]i32{ 3, -2, -4 }), [2]u8{ 1, 2 });
    try expectEqual(countApplesAndOranges(7, 11, 5, 15, 3, 2, [*]i32{ -2, 2, 1 }, [*]i32{ 5, -6 }), [2]u8{ 1, 1 });
    try expectEqual(countApplesAndOranges(2, 3, 1, 5, 1, 1, [*]i32{-2}, [*]i32{-1}), [2]u8{ 0, 0 });
    try expectEqual(countApplesAndOranges(2, 3, 1, 5, 1, 1, [*]i32{2}, [*]i32{-2}), [2]u8{ 1, 1 });
}
