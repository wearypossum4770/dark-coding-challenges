const std = @import("std");
const ProjectRoot = @import("root");
const AutoHashMap = std.hash_map.AutoHashMap;
const Allocator = std.mem.Allocator;

pub fn romanToInt(romanNumber: []const u8) i32 {
    var romanNumerals = ProjectRoot.createRomanNumerals(i32, std.heap.page_allocator);
    var total: i32 = 0;
    var index: usize = 0;
    for (romanNumber) |numeral| {
        if (index >= romanNumber.len - 1) break;
        const current = romanNumerals.get(numeral) orelse 0;
        const next = romanNumerals.get(romanNumber[index + 1]) orelse 0;
        if (current < next) {
            total -= current;
        } else {
            total += current;
        }
        index += 1;
    }
    total += romanNumerals.get(romanNumber[index]) orelse 0;
    return total;
}
