const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqualStrings = std.testing.expectEqualStrings;

const Allocator = std.mem.Allocator;

const Rank = struct {
    index: usize,
    value: []const u8,
};
fn compareRank(_: void, lhs: Rank, rhs: Rank) bool {
    if (!std.mem.eql(u8, lhs.value, rhs.value)) return std.mem.lessThan(u8, lhs.value, rhs.value);
    return lhs.index < rhs.index;
}
pub fn packedRank(allocator: Allocator, words: []const []const u8, digit: usize) ![]Rank {
    var result = try allocator.alloc(Rank, words.len);
    errdefer allocator.free(result);
    for (words, 0..) |word, index| {
        result[index] = Rank{ .index = index, .value = word[word.len -| digit..] };
    }
    return result;
}
pub fn smallestTrimmedNumbers(allocator: Allocator, nums: []const []const u8, queries: []const []const usize) ?[]const usize {
    var result = allocator.alloc(usize, queries.len) catch return null;
    for (queries, 0..) |query, i| {
        const rank = query[0];
        const digit = query[1];
        const trimmed = packedRank(allocator, nums, digit) catch return null;
        defer allocator.free(trimmed);
        std.mem.sort(Rank, trimmed, {}, compareRank);
        result[i] = trimmed[rank - 1].index;
    }
    return result;
}

test "The rank should allocate itself" {
    const index: usize = 1;
    const value = "Hello World!";
    const rank = Rank{ .index = index, .value = value };
    try expectEqualStrings(rank.value, value);
}

test "the trimmed indices of ['102', '473', '251', '814']" {
    const nums = [_][]const u8{ "102", "473", "251", "814" };
    const queries = [_][]const usize{
        &[_]usize{ 1, 1 },
        &[_]usize{ 2, 3 },
        &[_]usize{ 4, 2 },
        &[_]usize{ 1, 2 },
    };
    const expected = [_]usize{ 2, 2, 1, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
test "the trimmed indices of [102,473,251]" {
    const nums = [_][]const u8{ "102", "473", "251", "814" };
    const queries = [_][]const usize{ &[_]usize{ 1, 1 }, &[_]usize{ 2, 3 }, &[_]usize{ 4, 2 }, &[_]usize{ 1, 2 } };
    const expected = [_]usize{ 2, 2, 1, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [24,37,96]" {
    const nums = [_][]const u8{ "24", "37", "96", "04" };
    const queries = [_][]const usize{ &[_]usize{ 2, 1 }, &[_]usize{ 2, 2 } };
    const expected = [_]usize{ 3, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [000,000,000]" {
    const nums = [_][]const u8{ "000", "000", "000", "000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 1 }, &[_]usize{ 2, 1 }, &[_]usize{ 3, 1 }, &[_]usize{ 4, 1 } };
    const expected = [_]usize{ 0, 1, 2, 3 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [0,0,0]" {
    const nums = [_][]const u8{ "0", "0", "0", "0" };
    const queries = [_][]const usize{ &[_]usize{ 1, 1 }, &[_]usize{ 2, 1 }, &[_]usize{ 3, 1 }, &[_]usize{ 4, 1 } };
    const expected = [_]usize{ 0, 1, 2, 3 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [123456789,987654321,111111111]" {
    const nums = [_][]const u8{ "123456789", "987654321", "111111111", "000000000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 9 }, &[_]usize{ 2, 9 }, &[_]usize{ 3, 9 }, &[_]usize{ 4, 9 } };
    const expected = [_]usize{ 3, 2, 0, 1 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [9,8,7]" {
    const nums = [_][]const u8{ "9", "8", "7", "6", "5", "4", "3", "2", "1", "0" };
    const queries = [_][]const usize{ &[_]usize{ 1, 1 }, &[_]usize{ 5, 1 }, &[_]usize{ 10, 1 } };
    const expected = [_]usize{ 9, 5, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [100,200,300]" {
    const nums = [_][]const u8{ "100", "200", "300", "400", "500" };
    const queries = [_][]const usize{ &[_]usize{ 1, 2 }, &[_]usize{ 2, 2 }, &[_]usize{ 3, 2 }, &[_]usize{ 4, 2 }, &[_]usize{ 5, 2 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [00100,00101,00110]" {
    const nums = [_][]const u8{ "00100", "00101", "00110", "00111", "01000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 3 }, &[_]usize{ 2, 3 }, &[_]usize{ 3, 3 }, &[_]usize{ 4, 3 }, &[_]usize{ 5, 3 } };
    const expected = [_]usize{ 4, 0, 1, 2, 3 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [99999,99998,99997]" {
    const nums = [_][]const u8{ "99999", "99998", "99997", "99996", "99995" };
    const queries = [_][]const usize{ &[_]usize{ 1, 5 }, &[_]usize{ 2, 5 }, &[_]usize{ 3, 5 }, &[_]usize{ 4, 5 }, &[_]usize{ 5, 5 } };
    const expected = [_]usize{ 4, 3, 2, 1, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [00001,00010,00100]" {
    const nums = [_][]const u8{ "00001", "00010", "00100", "01000", "10000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 5 }, &[_]usize{ 2, 5 }, &[_]usize{ 3, 5 }, &[_]usize{ 4, 5 }, &[_]usize{ 5, 5 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [123,123,123]" {
    const nums = [_][]const u8{ "123", "123", "123", "123", "123" };
    const queries = [_][]const usize{ &[_]usize{ 1, 3 }, &[_]usize{ 2, 3 }, &[_]usize{ 3, 3 }, &[_]usize{ 4, 3 }, &[_]usize{ 5, 3 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [000,001,002]" {
    const nums = [_][]const u8{ "000", "001", "002", "010", "100" };
    const queries = [_][]const usize{ &[_]usize{ 1, 3 }, &[_]usize{ 2, 3 }, &[_]usize{ 3, 3 }, &[_]usize{ 4, 3 }, &[_]usize{ 5, 3 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [9876543210,8765432109,7654321098]" {
    const nums = [_][]const u8{ "9876543210", "8765432109", "7654321098", "6543210987", "5432109876" };
    const queries = [_][]const usize{ &[_]usize{ 1, 10 }, &[_]usize{ 3, 10 }, &[_]usize{ 5, 10 } };
    const expected = [_]usize{ 4, 2, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [1,10,100]" {
    const nums = [_][]const u8{ "1", "10", "100", "1000", "10000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 5 }, &[_]usize{ 2, 5 }, &[_]usize{ 3, 5 }, &[_]usize{ 4, 5 }, &[_]usize{ 5, 5 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [999,998,997]" {
    const nums = [_][]const u8{ "999", "998", "997", "996", "995", "994", "993", "992", "991", "990" };
    const queries = [_][]const usize{ &[_]usize{ 1, 3 }, &[_]usize{ 5, 3 }, &[_]usize{ 10, 3 } };
    const expected = [_]usize{ 9, 5, 0 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [0000000000,0000000001,0000000010]" {
    const nums = [_][]const u8{ "0000000000", "0000000001", "0000000010", "0000000100", "0000001000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 10 }, &[_]usize{ 2, 10 }, &[_]usize{ 3, 10 }, &[_]usize{ 4, 10 }, &[_]usize{ 5, 10 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [1111111111,2222222222,3333333333]" {
    const nums = [_][]const u8{ "1111111111", "2222222222", "3333333333", "4444444444", "5555555555" };
    const queries = [_][]const usize{ &[_]usize{ 1, 10 }, &[_]usize{ 2, 10 }, &[_]usize{ 3, 10 }, &[_]usize{ 4, 10 }, &[_]usize{ 5, 10 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [1000000000,999999999,999999998]" {
    const nums = [_][]const u8{ "1000000000", "999999999", "999999998", "999999997", "999999996" };
    const queries = [_][]const usize{ &[_]usize{ 1, 10 }, &[_]usize{ 2, 10 }, &[_]usize{ 3, 10 } };
    const expected = [_]usize{ 0, 4, 3 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [000,001,010]" {
    const nums = [_][]const u8{ "000", "001", "010", "100", "999" };
    const queries = [_][]const usize{ &[_]usize{ 1, 3 }, &[_]usize{ 2, 3 }, &[_]usize{ 3, 3 }, &[_]usize{ 4, 3 }, &[_]usize{ 5, 3 } };
    const expected = [_]usize{ 0, 1, 2, 3, 4 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}

test "the trimmed indices of [000000,000001,000010]" {
    const nums = [_][]const u8{ "000000", "000001", "000010", "000100", "001000", "010000", "100000" };
    const queries = [_][]const usize{ &[_]usize{ 1, 6 }, &[_]usize{ 3, 6 }, &[_]usize{ 5, 6 }, &[_]usize{ 7, 6 } };
    const expected = [_]usize{ 0, 2, 4, 6 };
    const allocator = std.testing.allocator;
    const result = smallestTrimmedNumbers(allocator, &nums, &queries);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
