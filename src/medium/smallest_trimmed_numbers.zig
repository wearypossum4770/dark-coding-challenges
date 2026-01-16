const std = @import("std");

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
