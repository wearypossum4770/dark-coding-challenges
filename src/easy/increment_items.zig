const expectEqual = @import("std").testing.expectEqual;

pub fn incrementItems(items: []i32) []i32 {
    for (items) |*item| {
        item.* += 1;
    }
    return items[0..];
}

test "incrementing the array {0, 1, 2, 3}" {
    var items = [_]i32{ 0, 1, 2, 3 };
    var actual = [4]i32{ 1, 2, 3, 4 };
    try expectEqual(incrementItems(&items), &actual);
}
test "incrementing the array {2, 4, 6, 8}" {
    var items = [_]i32{ 2, 4, 6, 8 };
    var actual = [4]i32{ 3, 5, 7, 9 };
    try expectEqual(incrementItems(&items), &actual);
}
test "incrementing the array {-1, -2, -3, -4}" {
    var items = [_]i32{ -1, -2, -3, -4 };
    var actual = [4]i32{ 0, -1, -2, -3 };
    try expectEqual(incrementItems(&items), &actual);
}
