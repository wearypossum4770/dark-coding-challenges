const std = @import("std");

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
