const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

pub fn secondLargest(comptime T: type, nums: []T) T {
    std.mem.sort(T, nums, {}, std.sort.desc(T));
    return nums[1];
}
