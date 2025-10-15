const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

fn arrayContains(comptime T: type, haystack: []const T, needle: T) bool {
    for (haystack) |hay| {
        if (hay == needle) return true;
    }
    return false;
}
pub fn findWordsContaining(allocator: Allocator, words: []const []const u8, x: u8) ?[]const usize {
    var result = allocator.alloc(usize, words.len) catch return null;
    defer allocator.free(result);
    var index: usize = 0;
    for (words, 0..) |word, i| {
        if (arrayContains(u8, word, x)) {
            result[index] = i;
            index += 1;
        }
    }
    const copy = allocator.alloc(usize, index) catch return null;
    std.mem.copyForwards(usize, copy, result[0..index]);
    return copy;
}

test "indices of given character in ['abc','bcd','aaaa','cbc']" {
    const words = [_][]const u8{ "abc", "bcd", "aaaa", "cbc" };
    const x: u8 = 'a';
    const expected = [_]usize{ 0, 2 };
    const allocator = std.testing.allocator;
    const result = findWordsContaining(allocator, &words, x);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
test "indices of given character in ['leet','code']" {
    const words = [_][]const u8{ "leet", "code" };
    const x: u8 = 'e';
    const expected = [_]usize{ 0, 1 };
    const allocator = std.testing.allocator;
    const result = findWordsContaining(allocator, &words, x);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
test "indices of given character in ['abc','bcd','aaaa','cbc'']" {
    const words = [_][]const u8{ "abc", "bcd", "aaaa", "cbc" };
    const x: u8 = 'z';
    const expected = [_]usize{};
    const allocator = std.testing.allocator;
    const result = findWordsContaining(allocator, &words, x);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualSlices(usize, &expected, actual);
    } else return error.SkipZigTest;
}
