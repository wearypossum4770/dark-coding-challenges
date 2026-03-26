const std = @import("std");

const Allocator = std.mem.Allocator;
const AutoHashMap = std.AutoHashMap;
const ArrayList = std.ArrayList;

const Group = struct {
    key: u5,
    value: []const u8,
};

pub fn countFrequency(allocator: Allocator, s: []const u8) AutoHashMap(u8, u5) {
    var freq = AutoHashMap(u8, u5).init(allocator);
    for (s) |char| {
        if (freq.getEntry(char)) |entry| {
            entry.value_ptr.* += 1;
        } else {
            freq.put(char, 1) catch return freq;
        }
    }
    return freq;
}

pub fn frequencyGrouper(allocator: Allocator, freq: AutoHashMap(u8, u5)) ?AutoHashMap(u5, ArrayList(u8)) {
    var grouped = AutoHashMap(u5, ArrayList(u8)).init(allocator);

    var iter = freq.iterator();

    while (iter.next()) |entry| {
        const count = entry.value_ptr.*;
        const char = entry.key_ptr.*;

        if (grouped.getEntry(count)) |group| {
            group.value_ptr.append(allocator, char) catch return null;
        } else {
            var list: ArrayList(u8) = .empty;

            list.append(allocator, char) catch return null;
            grouped.put(count, list) catch return null;
        }
    }
    return grouped;
}

pub fn frequencySorter(allocator: Allocator, freq: AutoHashMap(u5, ArrayList(u8))) ?[]const u8 {
    const result = allocator.alloc(Group, freq.count()) catch return null;
    defer allocator.free(result);
    var index: usize = 0;

    var iter = freq.iterator();

    while (iter.next()) |entry| {
        if (freq.getEntry(entry.key_ptr.*)) |items| {
            result[index] = Group{ .key = items.key_ptr.*, .value = items.value_ptr.*.items };
            index += 1;
        }
    }

    std.mem.sort(Group, result, {}, struct {
        fn lessThan(_: void, a: Group, b: Group) bool {
            if (a.value.len != b.value.len) return b.value.len < a.value.len;
            return b.key < a.key;
        }
    }.lessThan);

    const top = result[0].value;

    const out = allocator.alloc(u8, top.len) catch return null;

    @memcpy(out, top);

    return out;
}

pub fn majorityFrequencyGroup(allocator: Allocator, s: []const u8) ?[]const u8 {
    var freq = countFrequency(allocator, s);

    defer freq.deinit();

    var entries = frequencyGrouper(allocator, freq);

    const groups = frequencySorter(allocator, entries.?);
    if (entries) |hash| {
        defer {
            var iter = hash.iterator();
            while (iter.next()) |entry| {
                entry.value_ptr.*.deinit(allocator);
            }
            entries.?.deinit();
        }
    }

    if (groups) |result| {
        defer allocator.free(result);
        const arr = allocator.dupe(u8, result) catch return null;
        std.mem.sort(u8, arr, {}, std.sort.asc(u8));
        return arr;
    }

    return null;
}
