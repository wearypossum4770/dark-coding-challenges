const std = @import("std");
const expectEqual = std.testing.expectEqual;

pub fn findContentChildren(children: []u8, cookies: []u8) u8 {
    std.mem.sort(u8, children, {}, std.sort.asc(u8));
    std.mem.sort(u8, cookies, {}, std.sort.asc(u8));
    var i: u8 = 0;
    var j: u8 = 0;
    while (i < children.len and j < cookies.len) {
        if (cookies[j] >= children[i]) {
            i += 1;
        }
        j += 1;
    }
    return i;
}

test "Five children and 6 cookies but no satisfied children" {
    var children = [_]u8{ 1, 5, 3, 3, 4 };
    var cookies = [_]u8{ 4, 2, 1, 2, 1, 3 };
    const result = findContentChildren(&children, &cookies);
    try expectEqual(3, result);
}
test "one child will be content" {
    var children = [_]u8{ 1, 2, 3 };
    var cookies = [_]u8{ 1, 1 };
    const result = findContentChildren(&children, &cookies);
    try expectEqual(1, result);
}
test "All children will be content" {
    var children = [_]u8{ 1, 2 };
    var cookies = [_]u8{ 1, 2, 3 };
    const result = findContentChildren(&children, &cookies);
    try expectEqual(2, result);
}
test "Unsorted children and sorted cookies" {
    var children = [_]u8{ 10, 9, 8, 7 };
    var cookies = [_]u8{ 5, 6, 7, 8 };
    const result = findContentChildren(&children, &cookies);
    try expectEqual(2, result);
}
test "No children " {
    var children = [_]u8{};
    var cookies = [_]u8{ 1, 2 };
    const result = findContentChildren(&children, &cookies);
    try expectEqual(0, result);
}
test "No cookies means no satisfied children" {
    var children = [_]u8{ 1, 2 };
    var cookies = [_]u8{};
    const result = findContentChildren(&children, &cookies);
    try expectEqual(0, result);
}
