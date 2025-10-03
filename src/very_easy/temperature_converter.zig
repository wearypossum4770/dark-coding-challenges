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
        return allocator.dupe(u8, "Error") catch return null;
    };
    if (std.mem.endsWith(u8, deg, "°F")) {
        const celsius = @round((temp - 32.0) * 5.0 / 9.0);
        return bufPrint(buf, "{d:.0}°C", .{celsius}) catch return null;
    }
    if (std.mem.endsWith(u8, deg, "°C")) {
        const fahrenheit = @round((temp * 9.0 / 5.0) + 32.0);
        return bufPrint(buf, "{d:.0}°F", .{fahrenheit}) catch return null;
    }
    return allocator.dupe(u8, "Error") catch return null;
}

const tolerance: f64 = 1e-2;
