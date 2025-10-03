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

const tolerance: f64 = 1e-2;
