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

test "parity sorting [4,2,5,7]" {
    const nums = [_]i32{ 4, 2, 5, 7 };
    const expected = [_]i32{ 4, 5, 2, 7 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParityTwo(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}

test "parity sorting [2,3]" {
    const nums = [_]u2{ 2, 3 };
    const expected = [_]u2{ 2, 3 };
    const allocator = std.testing.allocator;
    const result = sortArrayByParityTwo(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    } else return error.SkipZigTest;
}
