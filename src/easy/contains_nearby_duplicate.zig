const std = @import("std");

const expectEqual = std.testing.expectEqual;

const Allocator = std.mem.Allocator;
const AutoHashmap = std.hash_map.AutoHashMap;

pub fn containsNearbyDuplicateArrayBacked(comptime T: type, nums: []const T, k: T) bool {
    const maxValue: usize = 100_001;
    var lastSeen = [_]usize{0} ** maxValue;
    for (nums, 0..) |num, i| {
        const n: usize = @intCast(num);
        if (lastSeen[n] != -1 and i - lastSeen[n] <= k) return true;
        lastSeen[n] = i;
    }
    return false;
}
pub fn containsNearbyDuplicate(comptime T: type, allocator: Allocator, nums: []const T, k: T) ?bool {
    var seen = AutoHashmap(T, usize).init(allocator);
    defer seen.deinit();
    for (nums, 0..) |num, i| {
        if (seen.get(num)) |n| {
            if (@abs(i - n) <= k) return true;
        }
        seen.put(num, i) catch return null;
    }
    return false;
}

test "distinct indices whose difference is 3 in {1, 2, 3, 1} backed by array" {
    const nums = [_]i32{ 1, 2, 3, 1 };
    const k: @TypeOf(nums[0]) = 3;
    const expected = true;
    const actual = containsNearbyDuplicateArrayBacked(@TypeOf(nums[0]), &nums, k);
    try expectEqual(expected, actual);
}
test "distinct indices whose difference is 3 in {1, 2, 3, 1}" {
    const nums = [_]i32{ 1, 2, 3, 1 };
    const k: @TypeOf(nums[0]) = 3;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 1 in {1, 0, 1, 1}" {
    const nums = [_]i32{ 1, 0, 1, 1 };
    const k: @TypeOf(nums[0]) = 1;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 2 in {1, 2, 3, 1, 2, 3}" {
    const nums = [_]i32{ 1, 2, 3, 1, 2, 3 };
    const k: @TypeOf(nums[0]) = 2;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 10 in {5}" {
    const nums = [_]i32{5};
    const k: @TypeOf(nums[0]) = 10;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 0 in {1, 1}" {
    const nums = [_]i32{ 1, 1 };
    const k: @TypeOf(nums[0]) = 0;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 100_000 in {99, 99}" {
    const nums = [_]i32{ 99, 99 };
    const k: @TypeOf(nums[0]) = 100_000;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 1 in {1, 1, 1, 1, 1}" {
    const nums = [_]i32{ 1, 1, 1, 1, 1 };
    const k: @TypeOf(nums[0]) = 1;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 4 in {1, 2, 3, 4, 1}" {
    const nums = [_]i32{ 1, 2, 3, 4, 1 };
    const k: @TypeOf(nums[0]) = 4;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 4 in {1, 2, 3, 4, 5, 1}" {
    const nums = [_]i32{ 1, 2, 3, 4, 5, 1 };
    const k: @TypeOf(nums[0]) = 4;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 1 in {-1, -1}" {
    const nums = [_]i32{ -1, -1 };
    const k: @TypeOf(nums[0]) = 1;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 1 in {-5, 10, -5, 10}" {
    const nums = [_]i32{ -5, 10, -5, 10 };
    const k: @TypeOf(nums[0]) = 1;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 2 in {1, 2, 1, 3, 1}" {
    const nums = [_]i32{ 1, 2, 1, 3, 1 };
    const k: @TypeOf(nums[0]) = 2;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 1 in {1, 2, 1, 3, 1}" {
    const nums = [_]i32{ 1, 2, 1, 3, 1 };
    const k: @TypeOf(nums[0]) = 1;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 3 in {1, 5, 1, 6, 1}" {
    const nums = [_]i32{ 1, 5, 1, 6, 1 };
    const k: @TypeOf(nums[0]) = 3;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 2 in {0, 0, 0}" {
    const nums = [_]i32{ 0, 0, 0 };
    const k: @TypeOf(nums[0]) = 2;
    const expected = true;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
test "distinct indices whose difference is 5 in {0}" {
    const nums = [_]i32{0};
    const k: @TypeOf(nums[0]) = 5;
    const expected = false;
    const allocator = std.testing.allocator;
    const result = containsNearbyDuplicate(@TypeOf(nums[0]), allocator, &nums, k);
    if (result) |actual| {
        try expectEqual(expected, actual);
    } else return error.SkipZigTest;
}
