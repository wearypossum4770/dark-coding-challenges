const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn sortArrayByParityTwo(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    var result = allocator.alloc(T, nums.len) catch return null;
    var even: usize = 0;
    var odd: usize = 1;
    for (nums) |num| {
        if (@mod(num, 2) == 0) {
            result[even] = num;
            even += 2;
        } else {
            result[odd] = num;
            odd += 2;
        }
    }
    return result;
}
