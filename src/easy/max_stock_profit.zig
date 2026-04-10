const std = @import("std");

pub fn maxStockProfit(comptime T: type, prices: []const T) i32 {
    var minPrice = prices[0];
    var maxProfit: T = minPrice - minPrice;
    for (prices) |price| {
        minPrice = @min(minPrice, price);
        maxProfit = @max(maxProfit, price - minPrice);
    }
    return maxProfit;
}
