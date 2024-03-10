// -------------------------------------------------------------------------
//
// base64.c
//     Encoding and decoding routines for base64 without whitespace.
//
// Copyright (c) 2001-2024, PostgreSQL Global Development Group
//
//
// IDENTIFICATION
//       src/common/base64.c
//
// -------------------------------------------------------------------------
const std = @import("std");

const _base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

pub fn string_to_binary(input: []const u8) void {
    var bytes = input.bytes;
    std.debug.print("input={} bytes={}\n", .{ input, bytes });
}

pub fn main() void {
    const expected = "USA";
    string_to_binary(expected);
}
