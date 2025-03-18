const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const AutoHashMap = std.hash_map.AutoHashMap;

pub fn twoSum(comptime T: type, nums: []const T, target: T) ?[2]usize {
    var mapper = std.AutoHashMap(T, usize).init(std.heap.page_allocator);
    defer mapper.deinit();
    for (nums, 0..) |num, index| {
        const complement = target - num;
        if (mapper.contains(complement)) {
            const complementIndex = mapper.get(complement) orelse 0;
            return .{ complementIndex, index };
        }
        mapper.put(num, index) catch return null;
    }
    return null;
}
