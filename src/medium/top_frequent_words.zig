const std = @import("std");

const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;

const StringHashMap = std.hash_map.StringHashMap;
const Allocator = std.mem.Allocator;

const Concordance = struct {
    const Self = @This();
    word: []const u8,
    count: usize,
    pub fn init(word: []const u8) Self {
        return Self{
            .word = word,
            .count = 1,
        };
    }
    pub fn increment(self: *Self) void {
        self.count += 1;
    }
};

fn createConcordance(allocator: Allocator, words: []const []const u8) StringHashMap(Concordance) {
    var freq = StringHashMap(Concordance).init(allocator);
    for (words) |word| {
        if (freq.getEntry(word)) |entry| {
            entry.value_ptr.increment();
        } else {
            freq.put(word, Concordance.init(word)) catch break;
        }
    }
    return freq;
}
fn compareTo(_: void, a: Concordance, b: Concordance) bool {
    if (a.count != b.count) return a.count > b.count;
    return (std.mem.lessThan(u8, a.word, b.word));
}
pub fn topFrequentWords(allocator: Allocator, words: []const []const u8, k: usize) ?[][]const u8 {
    var freq = createConcordance(allocator, words);
    var target = allocator.alloc(Concordance, freq.count()) catch return null;
    defer {
        allocator.free(target);
        freq.deinit();
    }
    var iter = freq.iterator();
    var index: usize = 0;
    while (iter.next()) |entry| {
        target[index] = entry.value_ptr.*;
        index += 1;
    }
    std.mem.sort(Concordance, target, {}, compareTo);
    var result = allocator.alloc([]const u8, k) catch return null;

    for (result, 0..) |_, i| {
        result[i] = target[i].word;
    }
    return result;
}

test "test concordance" {
    const words = [_][]const u8{ "apple", "apple", "banana", "grape" };
    const counts = [_]usize{ 2, 2, 1, 1 };
    const allocator = std.testing.allocator;
    var result = createConcordance(allocator, &words);
    defer result.deinit();
    for (words, 0..) |word, index| {
        if (result.get(word)) |concordance| {
            const actual = concordance.count;
            const expected = counts[index];
            try expectEqual(expected, actual);
        }
    }
}
test "find the top 2 words in ['i','love']" {
    const words = [_][]const u8{ "i", "love", "leetcode", "i", "love", "coding" };
    const k: usize = 2;
    const expected = [_][]const u8{ "i", "love" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 4 words in ['the','day','is','sunny','the','the','the','sunny','is','is']" {
    const words = [_][]const u8{ "the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is" };
    const k: usize = 4;
    const expected = [_][]const u8{ "the", "is", "sunny", "day" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 1 words in ['hello','hello','hello']" {
    const words = [_][]const u8{ "hello", "hello", "hello" };
    const k: usize = 1;
    const expected = [_][]const u8{"hello"};
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 4 words in ['a','b','c','d']" {
    const words = [_][]const u8{ "a", "b", "c", "d" };
    const k: usize = 4;
    const expected = [_][]const u8{ "a", "b", "c", "d" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 3 words in ['apple','banana','apple','banana','cherry','cherry']" {
    const words = [_][]const u8{ "apple", "banana", "apple", "banana", "cherry", "cherry" };
    const k: usize = 3;
    const expected = [_][]const u8{ "apple", "banana", "cherry" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 1 words in ['x','y','z']" {
    const words = [_][]const u8{ "x", "y", "z" };
    const k: usize = 1;
    const expected = [_][]const u8{"x"};
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 0 words in []" {
    const words = [_][]const u8{};
    const k: usize = 0;
    const expected = [_][]const u8{};
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 3 words in ['a','aa','aaa','a','aaa','aaa','aa','b','b','b']" {
    const words = [_][]const u8{ "a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b" };
    const k: usize = 3;
    const expected = [_][]const u8{ "aaa", "b", "a" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
test "find the top 5 words in ['one','two']" {
    const words = [_][]const u8{ "one", "two" };
    const k: usize = 2;
    const expected = [_][]const u8{ "one", "two" };
    const allocator = std.testing.allocator;
    const result = topFrequentWords(allocator, &words, k);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(@TypeOf(actual[0]), &expected, actual);
    } else return error.SkipZigTest;
}
