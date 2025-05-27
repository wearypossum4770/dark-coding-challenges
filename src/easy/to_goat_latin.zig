const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;

const TextTools = @import("text_tools.zig");
const Allocator = std.mem.Allocator;

const delimiter = " ";
const suffix = "ma";

pub fn arithmeticSeries(comptime T: type, n: T) T {
    return @divFloor(n * (n + 1), 2);
}

pub fn duplicateCharacter(allocator: Allocator, char: u8, len: usize) []const u8 {
    var index: usize = 0;
    var word = allocator.alloc(u8, len) catch return "";
    while (index < len) : (index += 1) {
        word[index] = char;
    }
    return word;
}

pub fn characterPopAppend(allocator: Allocator, word: []const u8) ?[]const u8 {
    var array = allocator.alloc(u8, word.len) catch return null;
    var index: usize = 1;
    for (word[1..]) |letter| {
        array[index - 1] = letter;
        index += 1;
    }
    array[word.len - 1] = word[0];
    return array;
}

pub fn concatenateStrings(allocator: Allocator, destination: []const u8, first: []const u8, second: []const u8) ?[]const u8 {
    const max = destination.len + first.len + second.len;
    var array = allocator.alloc(u8, max) catch return null;
    var index: usize = 0;
    var dest: usize = 0;
    var f: usize = 0;
    var s: usize = 0;
    while (dest + f + s < max) : (index += 1) {
        if (dest < destination.len) {
            array[index] = destination[dest];
            dest += 1;
        } else if (f < first.len) {
            array[index] = first[f];
            f += 1;
        } else {
            array[index] = second[s];
            s += 1;
        }
    }
    return array;
}

pub fn toGoatLatin(allocator: Allocator, sentence: []const u8) ?[]const u8 {
    if (sentence.len == 0) return null;

    var iter = std.mem.splitAny(u8, sentence, delimiter);
    var target = std.ArrayList(u8).init(allocator);

    var index: usize = 0;

    while (iter.next()) |word| : (index += 1) {
        const ending = duplicateCharacter(allocator, 'a', index + 1);
        defer allocator.free(ending);
        const isLast = iter.peek() == null;
        if (TextTools.isVowel(word[0])) {
            const buffer = concatenateStrings(allocator, word, suffix, ending);
            if (buffer) |buf| {
                defer allocator.free(buf);
                target.appendSlice(buf) catch return null;
                if (!isLast) target.append(0x20) catch return null;
            }
        } else {
            const destination = characterPopAppend(allocator, word);
            defer allocator.free(destination.?);
            const buffer = concatenateStrings(allocator, destination.?, suffix, ending);
            if (buffer) |buf| {
                defer allocator.free(buf);
                target.appendSlice(buf) catch return null;
                if (!isLast) target.append(0x20) catch return null;
            }
        }
    }
    const trimmed = target.toOwnedSlice() catch return null;
    return std.mem.trimRight(u8, trimmed, " ");
}

test "put first character at end of string" {
    const allocator = std.testing.allocator;
    const word = "speak";
    const expected = "peaks";

    const actual = characterPopAppend(allocator, word) orelse "";
    defer allocator.free(actual);
    try expectEqualStrings(expected, actual);
}

test "a normal sentence translated to goat-latin" {
    const allocator = std.testing.allocator;
    const sentence = "I speak Goat Latin";
    const expected = "Imaa peaksmaaa oatGmaaaa atinLmaaaaa";
    const actual = toGoatLatin(allocator, sentence) orelse "";
    defer allocator.free(actual);
    try expectEqualStrings(expected, actual);
}

test "a " {
    const allocator = std.testing.allocator;
    const sentence = "The quick brown fox jumped over the lazy dog";
    const expected = "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa";
    const actual = toGoatLatin(allocator, sentence) orelse "";
    defer allocator.free(actual);
    try expectEqualStrings(expected, actual);
}
