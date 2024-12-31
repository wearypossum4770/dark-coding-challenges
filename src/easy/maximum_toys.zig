const std = @import("std");
const expectEqual = std.testing.expectEqual;

pub fn maximumToys(prices: []const i32, budget: i32) i32 {
    // - prices: Array of toy prices
    // - budget: Maximum amount to spend
}

test "budget of 50" {
    const budget = 50;
    const prices = [_]i32{ 1, 12, 5, 111, 200, 1000, 10 };
    const actual: i32 = 4;
    std.testing.expectEqual(maximumToys(prices[0..], budget), actual);
}
