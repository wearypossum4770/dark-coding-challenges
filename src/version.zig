const std = @import("std");
const SemanticVersion = std.SemanticVersion;
const StructuredVersion = struct {
    major: usize,
    minor: usize,
    patch: usize,
    pre: []const u8,
    build: []const u8,
    const Self = @This();
    pub fn includesVersion() bool {}
    pub fn isAtLeast() bool {}
    pub fn init() Self {
        return StructuredVersion{
            .major = 0,
            .minor = 0,
            .patch = 0,
            .pre = "",
            .build = "",
        };
    }
    pub fn toInteger(self: Self) usize {
        return self.major * 10_000 + self.minor * 100 + self.patch * 10;
    }
    pub fn setMajor(self: *Self, major: usize) *Self {
        self.major = major;
        return self;
    }
    pub fn setMinor(self: *Self, minor: usize) *Self {
        self.minor = minor;
        return self;
    }
    pub fn setPatch(self: *Self, patch: usize) *Self {
        self.patch = patch;
        return self;
    }
    pub fn setPre(self: *Self, pre: []const u8) *Self {
        self.pre = pre;
        return self;
    }
    pub fn setBuild(self: *Self, build: []const u8) *Self {
        self.build = build;
        return self;
    }
};
pub fn getVersionInfo(text: []const u8) StructuredVersion {
    const version = SemanticVersion.parse(text) catch {
        return StructuredVersion.init();
    };
    std.debug.print("{}\n", .{std.time.ns_per_s});
    return StructuredVersion{
        .major = version.major,
        .minor = version.minor,
        .patch = version.patch,
        .build = version.build orelse "",
        .pre = version.pre orelse "",
    };
}

test "software version 3.2.0" {
    const version = "3.2.0";
    const result = getVersionInfo(version);
    const output = StructuredVersion{
        .major = 3,
        .minor = 2,
        .patch = 0,
        .build = "",
        .pre = "",
    };
    try std.testing.expectEqual(output, result);
    try std.testing.expectEqualSlices(u8, output.build, "");
    try std.testing.expectEqual(30_200, output.toInteger());
}

// pub fn parseBoolean(text: []const u8) bool {
//  * Valid values are: true, false, yes, no, on, off, 1, 0; as well as unique

// }
