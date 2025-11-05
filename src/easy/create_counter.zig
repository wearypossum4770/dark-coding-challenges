const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;

pub fn createCounter(comptime T: type) type {
    return struct {
        const Self = @This();
        initial: T,
        count: T,
        pub fn increment(self: *Self) void {
            self.count += 1;
        }
        pub fn init(n: i32) Self {
            return Self{
                .initial = n,
                .count = n,
            };
        }
    };
}
pub fn capture(comptime T: type, nums: []T, index: usize, num: T) void {
    nums[index] = num;
}

test "example 1 (basic positive start)" {
    // Tests a normal starting point with three calls.
    const n: i32 = 10;
    const operations = [_]u8{ 'c', 'c', 'c' };
    const expected = [_]i32{ 10, 11, 12 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "example 2 (negative start value)" {
    // Starts at -2 and increments across zero into positive numbers.
    const n: i32 = -2;
    const operations = [_]u8{ 'c', 'c', 'c', 'c', 'c' };
    const expected = [_]i32{ -2, -1, 0, 1, 2 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "single call from zero" {
    // Verifies counter correctly returns 0 when called once.
    const n: i32 = 0;
    const operations = [_]u8{'c'};
    const expected = [_]i32{0};
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "no calls made" {
    // Tests behavior when there are no calls (should return empty slice).
    const n: i32 = 5;
    const operations = [_]u8{};
    const expected = [_]i32{};
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "upper bound near 1000" {
    // Starts near the constraint limit and ensures proper increments.
    const n: i32 = 999;
    const operations = [_]u8{ 'c', 'c', 'c' };
    const expected = [_]i32{ 999, 1000, 1001 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "lower bound near -1000" {
    // Starts at lower limit and ensures correct increments into negatives.
    const n: i32 = -1000;
    const operations = [_]u8{ 'c', 'c' };
    const expected = [_]i32{ -1000, -999 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "multiple increments (10 calls)" {
    // Tests correct sequential increments with a moderate call count.
    const n: i32 = 3;
    const operations = [_]u8{ 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c' };
    const expected = [_]i32{ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "stress test (20 increments)" {
    // Tests sustained increments and memory allocation consistency.
    const n: i32 = 42;
    const operations = [_]u8{ 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c', 'c' };
    const expected = [_]i32{ 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "single call (simple check)" {
    // Verifies function works with a one-call non-zero start.
    const n: i32 = 7;
    const operations = [_]u8{'c'};
    const expected = [_]i32{7};
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}

test "midrange five calls" {
    // Standard use case with medium integer and five calls.
    const n: i32 = 100;
    const operations = [_]u8{ 'c', 'c', 'c', 'c', 'c' };
    const expected = [_]i32{ 100, 101, 102, 103, 104 };
    const allocator = std.testing.allocator;
    var actual = allocator.alloc(@TypeOf(n), operations.len) catch return error.SkipZigTest;
    defer allocator.free(actual);

    var counter = createCounter(@TypeOf(n)).init(n);
    for (operations, 0..) |_, index| {
        if (index != 0) counter.increment();
        capture(@TypeOf(n), actual[0..], index, counter.count);
    }
    try expectEqualSlices(@TypeOf(n), &expected, actual);
}
