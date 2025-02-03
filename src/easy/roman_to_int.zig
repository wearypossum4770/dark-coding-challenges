const std = @import("std");
const utilities = @import("./utilities.zig");
const expectEqual = std.testing.expectEqual;

pub fn romanToInt(romanNumber: []const u8) i32 {
    var romanNumerals = utilities.createRomanNumerals(i32, std.heap.page_allocator);
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

test "test roman numeral IV" {
    const romanNumber = "IV";
    const result = romanToInt(romanNumber);
    try expectEqual(4, result);
}

test "test roman numeral XC" {
    const romanNumber = "XC";
    const result = romanToInt(romanNumber);
    try expectEqual(90, result);
}

test "test roman numeral CM" {
    const romanNumber = "CM";
    const result = romanToInt(romanNumber);
    try expectEqual(900, result);
}

test "test roman numeral MMM" {
    const romanNumber = "MMM";
    const result = romanToInt(romanNumber);
    try expectEqual(3_000, result);
}

test "test roman numeral III" {
    const romanNumber = "III";
    const result = romanToInt(romanNumber);
    try expectEqual(3, result);
}

test "test roman numeral XXVII" {
    const romanNumber = "XXVII";
    const result = romanToInt(romanNumber);
    try expectEqual(27, result);
}

test "test roman numeral LVIII" {
    const romanNumber = "LVIII";
    const result = romanToInt(romanNumber);
    try expectEqual(58, result);
}

test "test roman numeral MCMXCIV" {
    const romanNumber = "MCMXCIV";
    const result = romanToInt(romanNumber);
    try expectEqual(1_994, result);
}

test "test roman numeral MMMCMXCIV" {
    const romanNumber = "MMMCMXCIV";
    const result = romanToInt(romanNumber);
    try expectEqual(3_994, result);
}

test "test roman numeral I" {
    const romanNumber = "I";
    const result = romanToInt(romanNumber);
    try expectEqual(1, result);
}

test "test roman numeral VIII" {
    const romanNumber = "VIII";
    const result = romanToInt(romanNumber);
    try expectEqual(8, result);
}

test "test roman numeral XXIX" {
    const romanNumber = "XXIX";
    const result = romanToInt(romanNumber);
    try expectEqual(29, result);
}

test "test roman numeral LIV" {
    const romanNumber = "LIV";
    const result = romanToInt(romanNumber);
    try expectEqual(54, result);
}

test "test roman numeral CCV" {
    const romanNumber = "CCV";
    const result = romanToInt(romanNumber);
    try expectEqual(205, result);
}

test "test roman numeral CDXLIV" {
    const romanNumber = "CDXLIV";
    const result = romanToInt(romanNumber);
    try expectEqual(444, result);
}

test "test roman numeral CMXCIX" {
    const romanNumber = "CMXCIX";
    const result = romanToInt(romanNumber);
    try expectEqual(999, result);
}

test "test roman numeral M" {
    const romanNumber = "M";
    const result = romanToInt(romanNumber);
    try expectEqual(1_000, result);
}

test "test roman numeral MMMDCCCLXXXVIII" {
    const romanNumber = "MMMDCCCLXXXVIII";
    const result = romanToInt(romanNumber);
    try expectEqual(3_888, result);
}

test "test roman numeral MMMCMX" {
    const romanNumber = "MMMCMX";
    const result = romanToInt(romanNumber);
    try expectEqual(3_910, result);
}
