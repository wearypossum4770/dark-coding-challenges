const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const AutoHashMap = std.hash_map.AutoHashMap;
pub fn distributeCandies(comptime T: type, allocator: Allocator, candyType: []const T) ?u32 {
    var set = AutoHashMap(@TypeOf(candyType[0]), bool).init(allocator);
    defer set.deinit();
    for (candyType) |candy| {
        if (!set.contains(candy)) {
            set.put(candy, true) catch return null;
        }
    }
    return @intCast(@min(set.count(), candyType.len / 2));
}

test "Alice has the candy types [1,1,2,2,3,3]" {
    const candyType = [_]i32{ 1, 1, 2, 2, 3, 3 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has the candy types [1,1,2,3]" {
    const candyType = [_]i32{ 1, 1, 2, 3 };
    const expected: u32 = 2;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has the candy types [6,6,6,6]" {
    const candyType = [_]i32{ 6, 6, 6, 6 };
    const expected: u32 = 1;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has 3 unique candies and can eat 3" {
    const candyType = [_]i32{ 1, 1, 2, 2, 3, 3 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has 3 unique candies and can eat 2" {
    const candyType = [_]i32{ 1, 1, 2, 3 };
    const expected: u32 = 2;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has 1 unique candies and can eat 2 -> only 1 type" {
    const candyType = [_]i32{ 6, 6, 6, 6 };
    const expected: u32 = 1;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has 6 unique candies and can eat 3" {
    const candyType = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has 1 unique" {
    const candyType = [_]i32{ 1, 1 };
    const expected: u32 = 1;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has no candies can't eay any" {
    const candyType = [_]i32{};
    const expected: u32 = 0;
    const allocator = std.testing.allocator;
    const result = distributeCandies(i32, allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has <constraint non-conforming> 1 unique, 1 count cannot eat" {
    const candyType = [_]i32{1};
    const expected: u32 = 0;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "Alice has 2 unique candies and can eat 1" {
    const candyType = [_]i32{ 1, 2 };
    const expected: u32 = 1;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has 4 unique, can eat 3 → can only pick 3" {
    const candyType = [_]i32{ 1, 2, 3, 4, 1, 2 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has All same but odd count → 1 type only" {
    const candyType = [_]i32{ 5, 5, 5, 5, 5 };
    const expected: u32 = 1;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has Half unique > half total" {
    const candyType = [_]i32{ 1, 2, 3, 4, 4, 4 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has Many duplicates, few unique" {
    const candyType = [_]i32{ 1, 1, 1, 2, 2, 2, 3, 3 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has Alternate pattern, even size" {
    const candyType = [_]i32{ 1, 2, 1, 2, 3, 3 };
    const expected: u32 = 3;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}

test "Alice has Alternate pattern, odd size" {
    const candyType = [_]i32{ 1, 2, 1, 2, 3 };
    const expected: u32 = 2;
    const allocator = std.testing.allocator;
    const result = distributeCandies(@TypeOf(candyType[0]), allocator, &candyType);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
