const std = @import("std");

const Allocator = std.mem.Allocator;
const AutoHashMap = std.AutoHashMap;

pub fn longestPalindrome(allocator: Allocator, s: []const u8) ?usize {
    var freq = AutoHashMap(u8, usize).init(allocator);
    defer freq.deinit();
    for (s) |char| {
        if (freq.getEntry(char)) |entry| {
            entry.value_ptr.* += 1;
        } else {
            freq.put(char, 1) catch return null;
        }
    }
    var oddCount: usize = 0;
    var iter = freq.valueIterator();
    while (iter.next()) |value| {
        if (@mod(value.*, 2) == 1) {
            oddCount += 1;
        }
    }
    if (oddCount > 1) return s.len + 1 - oddCount;
    return s.len;
}
