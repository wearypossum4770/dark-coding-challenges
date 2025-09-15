const std = @import("std");

const expectEqual = std.testing.expectEqual;

pub fn arrayReduce(comptime T: type, arr: []const T) T {
    if (arr.len == 0) return 0;
    var sum = arr[0];
    var index: usize = 1;
    while (index < arr.len) : (index += 1) {
        sum += arr[index];
    }
    return sum;
}
pub fn maximumWealth(comptime T: type, accounts: [][]const T) T {
    var max: T = std.math.minInt(T);
    if (accounts.len == 0) return 0;
    for (accounts) |account| {
        const total = arrayReduce(T, account);
        if (max < total) {
            max = total;
        }
    }
    if (max == std.math.minInt(T)) return 0;
    return max;
}
