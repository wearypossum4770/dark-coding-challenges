const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;

const Allocator = std.mem.Allocator;
const AutoHashMap = std.AutoHashMap;

pub fn sortArray(comptime T: type, allocator: Allocator, nums: []const T) ?[]const T {
    const result = allocator.alloc(T, nums.len) catch return null;
    std.mem.copyBackwards(T, result, nums);
    std.mem.sort(T, result, {}, std.sort.asc(T));
    return result;
}

test "sorting [5,1,1,2,0,...]" {
    var nums = [_]i32{ 5, 1, 1, 2, 0, 0 };
    const expected = [_]i32{ 0, 0, 1, 1, 2, 5 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), actual, &expected);
    }
}
test "sorting [5,2,3,1...]" {
    var nums = [_]i32{ 5, 2, 3, 1 };
    const expected = [_]i32{ 1, 2, 3, 5 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}

test "sorting [5,5,5,5...]" {
    var nums = [_]i32{ 5, 5, 5, 5 };
    const expected = [_]i32{ 5, 5, 5, 5 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}

test "sorting [7,7,7,7,7,...]" {
    var nums = [_]i32{ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 };
    const expected = [_]i32{ 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [0,0,0,0,0,...]" {
    var nums = [_]i32{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    const expected = [_]i32{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-50_000,50_000, -49_999...]" {
    var nums = [_]i64{ -50_000, 50_000, -49_999, 49_999 };
    const expected = [_]i64{ -50_000, -49_999, 49_999, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [10,20,30,4...]" {
    var nums = [_]i32{ 10, 20, 30, 40, 50, 80, 60, 70, 90, 100, 120, 110 };
    const expected = [_]i32{ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [100,90,80,...]" {
    var nums = [_]i32{ 100, 90, 80, 70, 60, 50, 40, 30, 20, 10 };
    const expected = [_]i32{ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [50_000,4999...]" {
    var nums = [_]i32{ 50_000, 49_999, 49998, -50_000, -49_999, -49998, 0, 1, -1, 2, -2 };
    const expected = [_]i32{ -50_000, -49_999, -49998, -2, -1, 0, 1, 2, 49998, 49_999, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-50_000,-50...]" {
    var nums = [_]i32{ -50_000, -50_000, -50_000, -50_000, -50_000, 50_000, 50_000, 50_000, 50_000, 50_000 };
    const expected = [_]i32{ -50_000, -50_000, -50_000, -50_000, -50_000, 50_000, 50_000, 50_000, 50_000, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [1, 2, 3, 4, 5, 6, 7, -1]" {
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, -1 };
    const expected = [_]i32{ -1, 1, 2, 3, 4, 5, 6, 7 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [1,2,3,4,5...]" {
    var nums = [_]i32{ 1, 2, 3, 4, 5 };
    const expected = [_]i32{ 1, 2, 3, 4, 5 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [0,0,0,0,1,...]" {
    var nums = [_]i32{ 0, 0, 0, 0, 1, 1, -1, -1, 2, 2, -2, -2, 0, 3, -3, 3, -3, 0, 1, -1, 2, -2, 0 };
    const expected = [_]i32{ -3, -3, -2, -2, -2, -1, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [4,-7,2,11,...]" {
    var nums = [_]i32{ 4, -7, 2, 11, -3, 0, 9, 5, -12, 8, 1, -6, 3, -1, 10, -4, 7, 13, -8, 6, -2, 12, -5, 9 };
    const expected = [_]i32{ -12, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 10, 11, 12, 13 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-42,17,99,...]" {
    var nums = [_]i32{ -42, 17, 99, -88, 0, 33, 76, -15, 61, 23, -71, 8, 54, -29, 92, -3, 47, -66 };
    const expected = [_]i32{ -88, -71, -66, -42, -29, -15, -3, 0, 8, 17, 23, 33, 47, 54, 61, 76, 92, 99 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [50_000,-500...]" {
    var nums = [_]i32{ 50_000, -50_000, 50_000, -50_000, 0 };
    const expected = [_]i32{ -50_000, -50_000, 0, 50_000, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [1,1,1,1,1,...]" {
    var nums = [_]i32{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
    const expected = [_]i32{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-50_000,50_000...]" {
    var nums = [_]i32{ -50_000, 50_000, -50_000, 50_000, -50_000 };
    const expected = [_]i32{ -50_000, -50_000, -50_000, 50_000, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}

test "sorting [ 1, 2, 3, 4, 5, 6, 7, 8, 9]" {
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [5...]" {
    var nums = [_]i32{5};
    const expected = [_]i32{5};
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-4,-1,0,2,...]" {
    var nums = [_]i32{ -4, -1, 0, 2, 5 };
    const expected = [_]i32{ -4, -1, 0, 2, 5 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [10,8,6,4,2...]" {
    var nums = [_]i32{ 10, 8, 6, 4, 2, 1, 3, 5, 7, 9 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [50_000,-50_000, 0...]" {
    var nums = [_]i32{ 50_000, -50_000, 0, 49_999, -49_999 };
    const expected = [_]i32{ -50_000, -49_999, 0, 49_999, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-50_000,500...]" {
    var nums = [_]i32{ -50_000, 50_000, 0, -49_999, 49_999 };
    const expected = [_]i32{ -50_000, -49_999, 0, 49_999, 50_000 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [...]" {
    var nums = [_]u2{};
    const expected = [_]u2{};
    const allocator = std.testing.allocator;
    const result = sortArray(u2, allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(u2, &expected, actual);
    }
}
test "sorting [1,2,3,4...]" {
    var nums = [_]i32{ 1, 2, 3, 4 };
    const expected = [_]i32{ 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [42...]" {
    var nums = [_]i32{42};
    const expected = [_]i32{42};
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}

test "sorting [1...]" {
    var nums = [_]i32{1};
    const expected = [_]i32{1};
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-50_000...]" {
    var nums = [_]i32{-50_000};
    const expected = [_]i32{-50_000};
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [50_000...]" {
    var nums = [_]i32{50_000};
    const expected = [_]i32{50_000};
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [7,7,7,7,7...]" {
    var nums = [_]i32{ 7, 7, 7, 7, 7 };
    const expected = [_]i32{ 7, 7, 7, 7, 7 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [-1,0,1...]" {
    var nums = [_]i32{ -1, 0, 1 };
    const expected = [_]i32{ -1, 0, 1 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [4,-7,11,2,...]" {
    var nums = [_]i32{ 4, -7, 11, 2, -3, 0, 9, 5, -12, 8 };
    const expected = [_]i32{ -12, -7, -3, 0, 2, 4, 5, 8, 9, 11 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [0,0,0,1,-1...]" {
    var nums = [_]i32{ 0, 0, 0, 1, -1, 2, -2, 0 };
    const expected = [_]i32{ -2, -1, 0, 0, 0, 0, 1, 2 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
test "sorting [1,2,3,4,5,...]" {
    var nums = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 };
    const allocator = std.testing.allocator;
    const result = sortArray(@TypeOf(nums[0]), allocator, &nums);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(nums[0]), &expected, actual);
    }
}
