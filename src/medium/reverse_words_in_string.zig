const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

pub fn reverseWordsInString(allocator: Allocator, s: []const u8) ?[]const u8 {
    const trimmed = std.mem.trim(u8, s, &std.ascii.whitespace);

    var iter = std.mem.splitAny(u8, trimmed, &std.ascii.whitespace);

    var size: usize = 0;
    var words: ArrayList([]const u8) = .empty;

    while (iter.next()) |word| {
        if (word.len > 0 and !std.ascii.eqlIgnoreCase(word, &std.ascii.whitespace)) {
            size += word.len;
            words.append(allocator, word) catch return null;
        }
    }

    var result = allocator.alloc(u8, words.items.len - 1 + size) catch return null;

    var reversed = std.mem.reverseIterator(words.items);

    var index: usize = 0;

    while (reversed.next()) |word| {
        for (word) |char| {
            result[index] = char;
            index += 1;
        }
        if (index < result.len - 1) {
            result[index] = ' ';
            index += 1;
        }
    }
    defer words.deinit(allocator);
    return result;
}
