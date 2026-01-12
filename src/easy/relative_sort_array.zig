const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn relativeSortArray(comptime T: type, allocator: Allocator, arr1: []const T, arr2: []const T) ?[]const T {
    var freq = allocator.alloc(T, 1_001) catch return null;
    var result = allocator.alloc(T, arr1.len) catch return null;
    var index: usize = 0;
    defer allocator.free(freq);
    @memset(freq, 0);
    for (arr1) |num| {
        const position: usize = @intCast(num);
        freq[position] += 1;
    }
    for (arr2) |num| {
        const position: usize = @intCast(num);
        var count = freq[position];
        while (count > 0) : (count -= 1) {
            freq[position] -= 1;
            result[index] = num;
            index += 1;
        }
    }
    for (freq, 0..) |num, i| {
        const position: T = @intCast(i);
        var count = num;
        while (count > 0) : (count -= 1) {
            result[index] = position;
            index += 1;
        }
    }
    return result;
}
test "relatively sort [2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19]" {
    const arr1 = [_]i32{ 2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19 };
    const arr2 = [_]i32{ 2, 1, 4, 3, 9, 6 };
    const expected = [_]i32{ 2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [28, 6, 22, 8, 44, 17]" {
    const arr1 = [_]i32{ 28, 6, 22, 8, 44, 17 };
    const arr2 = [_]i32{ 22, 28, 8, 6 };
    const expected = [_]i32{ 22, 28, 8, 6, 17, 44 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [5, 3, 8, 1, 9, 2]" {
    const arr1 = [_]i32{ 5, 3, 8, 1, 9, 2 };
    const arr2 = [_]i32{};
    const expected = [_]i32{ 1, 2, 3, 5, 8, 9 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [5, 5, 2, 2, 8, 8]" {
    const arr1 = [_]i32{ 5, 5, 2, 2, 8, 8 };
    const arr2 = [_]i32{ 2, 5, 8 };
    const expected = [_]i32{ 2, 2, 5, 5, 8, 8 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [42]" {
    const arr1 = [_]i32{42};
    const arr2 = [_]i32{42};
    const expected = [_]i32{42};
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [100, 1, 100, 2]" {
    const arr1 = [_]i32{ 100, 1, 100, 2 };
    const arr2 = [_]i32{ 1, 2 };
    const expected = [_]i32{ 1, 2, 100, 100 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [3, 3, 3, 3, 3]" {
    const arr1 = [_]i32{ 3, 3, 3, 3, 3 };
    const arr2 = [_]i32{3};
    const expected = [_]i32{ 3, 3, 3, 3, 3 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [0]" {
    const arr1 = [_]i32{0};
    const arr2 = [_]i32{0};
    const expected = [_]i32{0};
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort []" {
    const arr1 = [_]usize{};
    const arr2 = [_]usize{ 1, 2, 3 };
    const expected = [_]usize{};
    const allocator = std.testing.allocator;
    const result = relativeSortArray(usize, allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [7, 1, 7, 1, 7]" {
    const arr1 = [_]i32{ 7, 1, 7, 1, 7 };
    const arr2 = [_]i32{ 7, 1 };
    const expected = [_]i32{ 7, 7, 7, 1, 1 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [999, 0, 500, 1000, 0]" {
    const arr1 = [_]i32{ 999, 0, 500, 1000, 0 };
    const arr2 = [_]i32{ 0, 1000 };
    const expected = [_]i32{ 0, 0, 1000, 500, 999 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "relatively sort [1, 2, 3, 4, 5]" {
    const arr1 = [_]i32{ 1, 2, 3, 4, 5 };
    const arr2 = [_]i32{ 5, 4, 3, 2, 1 };
    const expected = [_]i32{ 5, 4, 3, 2, 1 };
    const allocator = std.testing.allocator;
    const result = relativeSortArray(@TypeOf(arr1[0]), allocator, &arr1, &arr2);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(arr1[0]), &expected, actual);
    } else return error.SkipZigTest;
}
