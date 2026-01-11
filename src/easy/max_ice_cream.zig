const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
pub fn maxIceCream(comptime T: type, allocator: Allocator, costs: []const T, coins: T) ?T {
    var remaining = coins;
    var cones: T = 0;
    const result = allocator.dupe(T, costs) catch return null;
    std.mem.sort(T, result, {}, std.sort.asc(T));
    defer allocator.free(result);
    for (result) |cost| {
        if (cost <= remaining) {
            remaining -= cost;
            cones += 1;
        }
    }
    return cones;
}

test "purchased ice creams for prices [1, 3, 2, 4, 1] with balance 7" {
    const costs = [_]i32{ 1, 3, 2, 4, 1 };
    const coins: i32 = 7;
    const expected: i32 = 4;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1, 3, 2, 4, 1] with balance 10" {
    const costs = [_]i32{ 1, 3, 2, 4, 1 };
    const coins: i32 = 10;
    const expected: i32 = 4;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [10, 6, 8, 7, 7, 8] with balance 5" {
    const costs = [_]i32{ 10, 6, 8, 7, 7, 8 };
    const coins: i32 = 5;
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1, 6, 3, 1, 2, 5] with balance 20" {
    const costs = [_]i32{ 1, 6, 3, 1, 2, 5 };
    const coins: i32 = 20;
    const expected: i32 = 6;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1, 6, 3, 1, 2, 5] with balance 18" {
    const costs = [_]i32{ 1, 6, 3, 1, 2, 5 };
    const coins: i32 = 18;
    const expected: i32 = 6;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1, 6, 3, 1, 2, 5] with balance 17" {
    const costs = [_]u5{ 1, 6, 3, 1, 2, 5 };
    const coins: u5 = 17;
    const expected: u5 = 5;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1] with balance 0" {
    const costs = [_]i32{1};
    const coins: i32 = 0;
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1] with balance 1" {
    const costs = [_]i32{1};
    const coins: i32 = 1;
    const expected: i32 = 1;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [100000] with balance 99999" {
    const costs = [_]i32{100000};
    const coins: i32 = 99999;
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [100000] with balance 100000" {
    const costs = [_]i32{100000};
    const coins: i32 = 100000;
    const expected: i32 = 1;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [] with balance 100" {
    const costs = [_]i32{};
    const coins: i32 = 100;
    const expected: i32 = 0;
    const allocator = std.testing.allocator;
    const result = maxIceCream(i32, allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [2, 2, 2, 2, 2] with balance 9" {
    const costs = [_]i32{ 2, 2, 2, 2, 2 };
    const coins: i32 = 9;
    const expected: i32 = 4;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [2, 2, 2, 2, 2] with balance 10" {
    const costs = [_]i32{ 2, 2, 2, 2, 2 };
    const coins: i32 = 10;
    const expected: i32 = 5;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [1, 1, 1, 1, 1] with balance 3" {
    const costs = [_]i32{ 1, 1, 1, 1, 1 };
    const coins: i32 = 3;
    const expected: i32 = 3;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "purchased ice creams for prices [27, 23, 33, 26, 46, 86, 70, 85,....] with balance 241" {
    const costs = [_]u8{ 27, 23, 33, 26, 46, 86, 70, 85, 89, 82, 57, 66, 42, 18, 18, 5, 46, 56, 42, 82, 52, 78, 4, 27, 96, 74, 74, 52, 2, 24, 78, 18, 42, 10, 12, 10, 80, 30, 60, 38, 32, 7, 98, 26, 18, 62, 50, 42, 15, 14, 32, 86, 93, 98, 47, 46, 58, 42, 74, 69, 51, 53, 58, 40, 66, 46, 65, 2, 10, 82, 94, 26, 6, 78, 2, 101, 97, 16, 12, 18, 71, 5, 46, 22, 58, 12, 18, 62, 61, 51, 2, 18, 34, 12, 36, 58, 20, 12, 17, 70 };
    const coins: i32 = 241;
    const expected: i32 = 24;
    const allocator = std.testing.allocator;
    const result = maxIceCream(@TypeOf(costs[0]), allocator, &costs, coins);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
