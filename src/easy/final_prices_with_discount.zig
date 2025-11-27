const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn finalPricesWithDiscount(comptime T: type, allocator: Allocator, prices: []const T) ?[]const T {
    var result = allocator.alloc(T, prices.len) catch return null;
    std.mem.copyBackwards(T, result, prices);
    for (prices, 0..) |_, i| {
        for (prices[(i + 1)..]) |price| {
            if (price <= prices[i]) {
                result[i] = prices[i] - price;
                break;
            } else {
                result[i] = prices[i];
            }
        }
    }
    return result;
}
