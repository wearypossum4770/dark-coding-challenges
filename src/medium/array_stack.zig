const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn arrayStack(comptime T: type, allocator: Allocator, target: []const T, n: T) ?[][:0]const u8 {
    var result = allocator.alloc([:0]const u8, n * 2) catch return null;
    var index: usize = 0;
    var position: usize = 0;
    var counter: T = 1;
    while (index < target.len) : (counter += 1) {
        result[position] = "Push"[0..4 :0];
        position += 1;
        if (target[index] == counter) {
            index += 1;
        } else {
            result[position] = "Pop"[0..3 :0];
            position += 1;
        }
        if (counter > n) break;
    }
    result = allocator.realloc(result, position) catch result[0..position];
    result.len = position;
    return result;
}

test "operations for integer stream to create  [1, 3]" {
    const target = [_]u8{ 1, 3 };
    const n: u8 = 3;
    const expected = [_][:0]const u8{ "Push", "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [1, 2, 3]" {
    const target = [_]u8{ 1, 2, 3 };
    const n: u8 = 3;
    const expected = [_][:0]const u8{ "Push", "Push", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [1, 2]" {
    const target = [_]u8{ 1, 2 };
    const n: u8 = 4;
    const expected = [_][:0]const u8{ "Push", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [1]" {
    const target = [_]u8{1};
    const n: u8 = 1;
    const expected = [_][:0]const u8{"Push"};
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [2]" {
    const target = [_]u8{2};
    const n: u8 = 2;
    const expected = [_][:0]const u8{ "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [3]" {
    const target = [_]u8{3};
    const n: u8 = 3;
    const expected = [_][:0]const u8{ "Push", "Pop", "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [2, 3, 4]" {
    const target = [_]u8{ 2, 3, 4 };
    const n: u8 = 4;
    const expected = [_][:0]const u8{ "Push", "Pop", "Push", "Push", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [1, 3, 5, 7]" {
    const target = [_]u8{ 1, 3, 5, 7 };
    const n: u8 = 7;
    const expected = [_][:0]const u8{ "Push", "Push", "Pop", "Push", "Push", "Pop", "Push", "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [5]" {
    const target = [_]u8{5};
    const n: u8 = 5;
    const expected = [_][:0]const u8{ "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [4, 5]" {
    const target = [_]u8{ 4, 5 };
    const n: u8 = 5;
    const expected = [_][:0]const u8{ "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
test "operations for integer stream to create  [1, 2, 4]" {
    const target = [_]u8{ 1, 2, 4 };
    const n: u8 = 4;
    const expected = [_][:0]const u8{ "Push", "Push", "Push", "Pop", "Push" };
    const allocator = std.testing.allocator;
    const result = arrayStack(@TypeOf(target[0]), allocator, &target, n);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices([:0]const u8, &expected, actual);
    } else return error.SkipZigTest;
}
