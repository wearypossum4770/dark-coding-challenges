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
