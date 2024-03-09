const expectEqual = @import("std").testing.expectEqual;

pub fn makesTen(a: i32, b: i32) bool {
    if (a == 10 or b == 10) return true;
    return a + b == 10;
}
test "If any parameter is 10 or if their sums are 10" {
    try expectEqual(makesTen(9, 10), true);
    try expectEqual(makesTen(9, 9), false);
    try expectEqual(makesTen(1, 9), true);
    try expectEqual(makesTen(10, 1), true);
    try expectEqual(makesTen(10, 10), true);
    try expectEqual(makesTen(8, 2), true);
    try expectEqual(makesTen(8, 3), false);
    try expectEqual(makesTen(10, 42), true);
    try expectEqual(makesTen(12, -2), true);
}
