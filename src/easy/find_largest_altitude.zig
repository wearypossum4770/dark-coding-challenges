const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;

pub fn findLargestAltitude(comptime T: type, allocator: Allocator, gain: []const T) ?T {
    var result = allocator.alloc(T, gain.len + 1) catch return null;
    @memset(result, 0);
    var altitude: T = 0;
    for (gain, 0..) |height, i| {
        altitude += height;
        result[i] = altitude;
    }
    defer allocator.free(result);
    return std.mem.max(T, result);
}

test "find largest altitude 5,1,5,0,-" {
    const gain = [_]i7{ -5, 1, 5, 0, -7 };
    const allocator = std.testing.allocator;
    const expected: i7 = 1;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 4,-3,-2,-" {
    const gain = [_]i5{ -4, -3, -2, -1, 4, 3, 2 };
    const allocator = std.testing.allocator;
    const expected: i5 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 0" {
    const gain = [_]u0{0};
    const allocator = std.testing.allocator;
    const expected: u0 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 100" {
    const gain = [_]i32{100};
    const allocator = std.testing.allocator;
    const expected: i32 = 100;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude -100" {
    const gain = [_]i32{-100};
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 1" {
    const gain = [_]i32{1};
    const allocator = std.testing.allocator;
    const expected: i32 = 1;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,0,0,0" {
    const gain = [_]i32{ 0, 0, 0, 0 };
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,2,3,4,5" {
    const gain = [_]i32{ 1, 2, 3, 4, 5 };
    const allocator = std.testing.allocator;
    const expected: i32 = 15;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 1,-2,-3,-" {
    const gain = [_]i32{ -1, -2, -3, -4, -5 };
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,5,5,5" {
    const gain = [_]i32{ 5, 5, 5, 5 };
    const allocator = std.testing.allocator;
    const expected: i32 = 20;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 5,-5,-5,-" {
    const gain = [_]i32{ -5, -5, -5, -5 };
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 0,-20,10" {
    const gain = [_]i32{ 10, -20, 10 };
    const allocator = std.testing.allocator;
    const expected: i32 = 10;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,1,1,1,-1" {
    const gain = [_]i32{ 1, 1, 1, 1, -100 };
    const allocator = std.testing.allocator;
    const expected: i32 = 4;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 100,1,1,1" {
    const gain = [_]i32{ -100, 1, 1, 1, 1 };
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 0,-100,50" {
    const gain = [_]i32{ 50, -100, 50, -100, 50 };
    const allocator = std.testing.allocator;
    const expected: i32 = 50;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 00,-100,-" {
    const gain = [_]i32{ 100, -100, -100, -100 };
    const allocator = std.testing.allocator;
    const expected: i32 = 100;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 1,-1,-1,1" {
    const gain = [_]i32{ -1, -1, -1, 1, 1 };
    const allocator = std.testing.allocator;
    const expected: i32 = 0;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,-1,1,-1," {
    const gain = [_]i32{ 1, -1, 1, -1, 1, -1 };
    const allocator = std.testing.allocator;
    const expected: i32 = 1;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude ,1,1,1,1" {
    const gain = [_]i32{ 1, 1, 1, 1, 1 };
    const allocator = std.testing.allocator;
    const expected: i32 = 5;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "find largest altitude 00" {
    const gain = [_]i32{100};
    const allocator = std.testing.allocator;
    const expected: i32 = 100;
    const result = findLargestAltitude(@TypeOf(gain[0]), allocator, &gain);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
