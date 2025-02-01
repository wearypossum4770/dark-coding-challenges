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
test "twoSum with integers" {
    const nums = [_]usize{ 2, 7, 11, 15 };
    const target: usize = 9;
    const output = [_]usize{ 0, 1 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}

test "two sum simple increasing sequence" {
    const target: usize = 9;
    const nums = [_]usize{ 2, 7, 11, 15 };
    const output = [_]usize{ 0, 1 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum unordered elements" {
    const target: usize = 6;
    const nums = [_]usize{ 3, 2, 4 };
    const output = [_]usize{ 1, 2 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum duplicate values" {
    const target: usize = 6;
    const nums = [_]usize{ 3, 3 };
    const output = [_]usize{ 0, 1 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum mirrored elements" {
    const nums = [_]usize{ 3, 2, 3 };
    const target: usize = 6;
    const output = [_]usize{ 0, 2 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum inner duplicates" {
    const nums = [_]usize{ 2, 5, 5, 11 };
    const target: usize = 10;
    const output = [_]usize{ 1, 2 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
// test "two sum outer duplicates" {
//     const nums = [_]usize{ 0, 4, 3, 0 };
//     const target: usize = 0;
//     const output = [_]usize{ 0, 3 };
//     const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
//     try expectEqualSlices(usize, &result, &output);
// }
test "two sum crossing zero" {
    const nums = [_]isize{ -3, 4, 3, 90 };
    const target: isize = 0;
    const output = [_]usize{ 0, 2 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum descending negatives" {
    const nums = [_]isize{ -1, -2, -3, -4, -5 };
    const target: isize = -8;
    const output = [_]usize{ 2, 4 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum large numbers" {
    const nums = [_]usize{ 5, 75, 25 };
    const target: usize = 100;
    const output = [_]usize{ 1, 2 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum identical large numbers" {
    const nums = [_]usize{ 2222222, 2222222 };
    const target: usize = 4444444;
    const output = [_]usize{ 0, 1 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum sparse high values" {
    const nums = [_]usize{ 1, 6142, 8192, 10239 };
    const target: usize = 18431;
    const output = [_]usize{ 2, 3 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum mixed negatives" {
    const nums = [_]isize{ -10, -1, -18, -19 };
    const target: isize = -19;
    const output = [_]usize{ 1, 2 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum mixed positive and negative" {
    const nums = [_]isize{ -10, 7, 19, 15 };
    const target: isize = 9;
    const output = [_]usize{ 0, 2 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum boundary negatives" {
    const nums = [_]isize{ 0, 3, -3, 4, -1 };
    const target: isize = -1;
    const output = [_]usize{ 0, 4 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum sparse negatives and positives" {
    const nums = [_]isize{ -18, 12, 3, 0 };
    const target: isize = -6;
    const output = [_]usize{ 0, 1 };
    const result = twoSum(isize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
test "two sum mixed order small positives" {
    const nums = [_]usize{ 1, 3, 4, 2 };
    const target: usize = 6;
    const output = [_]usize{ 2, 3 };
    const result = twoSum(usize, &nums, target) orelse return error.TestFailed;
    try expectEqualSlices(usize, &result, &output);
}
