const std = @import("std");
const utilities = @import("./utilities.zig");
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;
pub fn romanToInt(romanNumber: []const u8, allocator: Allocator) i32 {
    var romanNumerals = utilities.createRomanNumerals(i32, allocator);
    defer romanNumerals.deinit();

    var total: i32 = 0;
    var index: usize = 0;

    while (index < romanNumber.len - 1) : (index += 1) {
        const current = romanNumerals.get(romanNumber[index]) orelse 0;
        const next = romanNumerals.get(romanNumber[index + 1]) orelse 0;
        if (current < next) {
            total -= current;
        } else {
            total += current;
        }
    }
    return total + (romanNumerals.get(romanNumber[index]) orelse 0);
}
