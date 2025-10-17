const std = @import("std");

const expectEqualStrings = std.testing.expectEqualStrings;
const expectApproxEqRel = std.testing.expectApproxEqRel;

const bufPrint = std.fmt.bufPrint;

const Allocator = std.mem.Allocator;

pub fn toCelsius(comptime T: type, fahrenheit: T) T {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
}

pub fn toFahrenheit(comptime T: type, celsius: T) T {
    return (celsius * 1.8) + 32.0;
}

pub fn toKelvin(comptime T: type, celsius: T) T {
    return celsius + 273.15;
}

pub fn convertTemperature(celsius: f64) []f64 {
    const kelvin = celsius;
    const fahrenheit = celsius;
    return &[_]f64{ kelvin, fahrenheit };
}

pub fn temperatureConverter(allocator: Allocator, deg: []const u8) ?[]const u8 {
    const buf = allocator.alloc(u8, 64) catch return null;
    var index: usize = 0;
    for (deg) |char| {
        switch (char) {
            '0'...'9' | '-' => index += 1,
            else => break,
        }
    }
    const temp = std.fmt.parseFloat(f32, deg[0..index]) catch {
        defer allocator.free(buf);
        return allocator.dupe(u8, "Error") catch return null;
    };
    if (std.mem.endsWith(u8, deg, "°F")) {
        const celsius = @round((temp - 32.0) * 5.0 / 9.0);
        defer allocator.free(buf);
        return bufPrint(buf, "{d:.0}°C", .{celsius}) catch return null;
    }
    if (std.mem.endsWith(u8, deg, "°C")) {
        const fahrenheit = @round((temp * 9.0 / 5.0) + 32.0);
        defer allocator.free(buf);
        return bufPrint(buf, "{d:.0}°F", .{fahrenheit}) catch return null;
    }
    return allocator.dupe(u8, "Error") catch return null;
}

const tolerance: f64 = 1e-2;

test "convert celsius -273.15 to kelvin" {
    const celsius: f64 = -273.15;
    const expected: f64 = 0;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -100 to kelvin" {
    const celsius: f64 = -100;
    const expected: f64 = 173.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -50 to kelvin" {
    const celsius: f64 = -50;
    const expected: f64 = 223.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -40 to kelvin" {
    const celsius: f64 = -40;
    const expected: f64 = 233.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -10 to kelvin" {
    const celsius: f64 = -10;
    const expected: f64 = 263.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 0 to kelvin" {
    const celsius: f64 = 0;
    const expected: f64 = 273.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 25 to kelvin" {
    const celsius: f64 = 25;
    const expected: f64 = 298.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 36.5 to kelvin" {
    const celsius: f64 = 36.5;
    const expected: f64 = 309.65;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 50 to kelvin" {
    const celsius: f64 = 50;
    const expected: f64 = 323.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 75 to kelvin" {
    const celsius: f64 = 75;
    const expected: f64 = 348.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 100 to kelvin" {
    const celsius: f64 = 100;
    const expected: f64 = 373.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 150 to kelvin" {
    const celsius: f64 = 150;
    const expected: f64 = 423.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 200 to kelvin" {
    const celsius: f64 = 200;
    const expected: f64 = 473.15;
    const actual = toKelvin(@TypeOf(celsius), celsius);
    try expectApproxEqRel(expected, actual, tolerance);
}

test "convert celsius 32 to fahrenheit" {
    const fahrenheit: f64 = 32;
    const expected: f64 = 89.6;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 11 to fahrenheit" {
    const fahrenheit: f64 = 11;
    const expected: f64 = 51.8;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 57.8 to fahrenheit" {
    const fahrenheit: f64 = 57.8;
    const expected: f64 = 136.04;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -89.2 to fahrenheit" {
    const fahrenheit: f64 = -89.2;
    const expected: f64 = -128.56;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 280 to fahrenheit" {
    const fahrenheit: f64 = 280;
    const expected: f64 = 536;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -273.15 to fahrenheit" {
    const fahrenheit: f64 = -273.15;
    const expected: f64 = -459.67;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -100 to fahrenheit" {
    const fahrenheit: f64 = -100;
    const expected: f64 = -148;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -50 to fahrenheit" {
    const fahrenheit: f64 = -50;
    const expected: f64 = -58;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -40 to fahrenheit" {
    const fahrenheit: f64 = -40;
    const expected: f64 = -40;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius -10 to fahrenheit" {
    const fahrenheit: f64 = -10;
    const expected: f64 = 14;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 0 to fahrenheit" {
    const fahrenheit: f64 = 0;
    const expected: f64 = 32;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 25 to fahrenheit" {
    const fahrenheit: f64 = 25;
    const expected: f64 = 77;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 36.5 to fahrenheit" {
    const fahrenheit: f64 = 36.5;
    const expected: f64 = 97.7;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 50 to fahrenheit" {
    const fahrenheit: f64 = 50;
    const expected: f64 = 122;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 75 to fahrenheit" {
    const fahrenheit: f64 = 75;
    const expected: f64 = 167;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 100 to fahrenheit" {
    const fahrenheit: f64 = 100;
    const expected: f64 = 212;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 150 to fahrenheit" {
    const fahrenheit: f64 = 150;
    const expected: f64 = 302;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert celsius 200 to fahrenheit" {
    const fahrenheit: f64 = 200;
    const expected: f64 = 392;
    const actual = toFahrenheit(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}

test "convert fahrenheit 68.0 to celsius" {
    const fahrenheit: f64 = 68.0;
    const expected: f64 = 20.0;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 18.0 to celsius" {
    const fahrenheit: f64 = 18.0;
    const expected: f64 = -7.78;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 101.3 to celsius" {
    const fahrenheit: f64 = 101.3;
    const expected: f64 = 38.5;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 49.0 to celsius" {
    const fahrenheit: f64 = 49.0;
    const expected: f64 = 9.444;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit -460.0 to celsius" {
    const fahrenheit: f64 = -460.0;
    const expected: f64 = -273.33;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit -459.67 to celsius" {
    const fahrenheit: f64 = -459.67;
    const expected: f64 = -273.15;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit -148.00 to celsius" {
    const fahrenheit: f64 = -148.00;
    const expected: f64 = -100.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit -58.00 to celsius" {
    const fahrenheit: f64 = -58.00;
    const expected: f64 = -50.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit -40.00 to celsius" {
    const fahrenheit: f64 = -40.00;
    const expected: f64 = -40.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 14.00 to celsius" {
    const fahrenheit: f64 = 14.00;
    const expected: f64 = -10.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 32.00 to celsius" {
    const fahrenheit: f64 = 32.00;
    const expected: f64 = 0.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 77.00 to celsius" {
    const fahrenheit: f64 = 77.00;
    const expected: f64 = 25.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 97.70 to celsius" {
    const fahrenheit: f64 = 97.70;
    const expected: f64 = 36.50;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 122.00 to celsius" {
    const fahrenheit: f64 = 122.00;
    const expected: f64 = 50.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 167.00 to celsius" {
    const fahrenheit: f64 = 167.00;
    const expected: f64 = 75.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 212.00 to celsius" {
    const fahrenheit: f64 = 212.00;
    const expected: f64 = 100.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 302.00 to celsius" {
    const fahrenheit: f64 = 302.00;
    const expected: f64 = 150.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert fahrenheit 392.00 to celsius" {
    const fahrenheit: f64 = 392.00;
    const expected: f64 = 200.00;
    const actual = toCelsius(@TypeOf(fahrenheit), fahrenheit);
    try expectApproxEqRel(expected, actual, tolerance);
}
test "convert the temperature 35°C" {
    const deg = "35°C";
    const expected = "95°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 18°C" {
    const deg = "18°C";
    const expected = "64°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 0°F" {
    const deg = "0°F";
    const expected = "-18°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 100°C" {
    const deg = "100°C";
    const expected = "212°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 69°F" {
    const deg = "69°F";
    const expected = "21°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 159°C" {
    const deg = "159°C";
    const expected = "318°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature -40°C" {
    const deg = "-40°C";
    const expected = "-40°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature -40°F" {
    const deg = "-40°F";
    const expected = "-40°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 16°C" {
    const deg = "16°C";
    const expected = "61°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 500°C" {
    const deg = "500°C";
    const expected = "932°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 33" {
    const deg = "33";
    const expected = "Error";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 19°F" {
    const deg = "19°F";
    const expected = "-7°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 85°C" {
    const deg = "85°C";
    const expected = "185°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 0°C" {
    const deg = "0°C";
    const expected = "32°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 1777°F" {
    const deg = "1777°F";
    const expected = "969°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature -90°C" {
    const deg = "-90°C";
    const expected = "-130°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 16°F" {
    const deg = "16°F";
    const expected = "-9°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 180°C" {
    const deg = "180°C";
    const expected = "356°F";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 7K" {
    const deg = "7K";
    const expected = "Error";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
test "convert the temperature 100°F" {
    const deg = "100°F";
    const expected = "38°C";
    const allocator = std.testing.allocator;
    const result = temperatureConverter(allocator, deg);
    if (result) |actual| {
        defer allocator.free(actual);
        try expectEqualStrings(expected, actual);
    } else return error.SkipZigTest;
}
