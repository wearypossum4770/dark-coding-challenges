const std = @import("std");

const expectEqual = std.testing.expectEqual;

const ArrayList = std.ArrayList;
const Allocator = std.mem.Allocator;

pub fn processBackSpaceCompare(allocator: Allocator, text: []const u8) ?[]const u8 {
    var buffer: ArrayList(u8) = .empty;
    defer buffer.deinit(allocator);
    for (text) |char| {
        if (char == '#') {
            _ = buffer.pop();
        } else {
            buffer.append(allocator, char) catch return null;
        }
    }
    return allocator.dupe(u8, buffer.items) catch return null;
}
pub fn backspaceCompare(allocator: Allocator, s: []const u8, t: []const u8) bool {
    const first = processBackSpaceCompare(allocator, s) orelse return false;
    defer allocator.free(first);
    const second = processBackSpaceCompare(allocator, t) orelse return false;
    defer allocator.free(second);
    return std.mem.eql(u8, first, second);
}

test "compare y#fo##f and y#f#o##f after backspaces" {
    const s = "y#fo##f";
    const t = "y#f#o##f";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab#c and ad#c after backspaces" {
    const s = "ab#c";
    const t = "ad#c";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab## and c#d# after backspaces" {
    const s = "ab##";
    const t = "c#d#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#c and b after backspaces" {
    const s = "a#c";
    const t = "b";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a and a after backspaces" {
    const s = "a";
    const t = "a";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a and b after backspaces" {
    const s = "a";
    const t = "b";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare # and # after backspaces" {
    const s = "#";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare #a and a after backspaces" {
    const s = "#a";
    const t = "a";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a# and  after backspaces" {
    const s = "a#";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a# and # after backspaces" {
    const s = "a#";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ## and # after backspaces" {
    const s = "##";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ### and ## after backspaces" {
    const s = "###";
    const t = "##";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a## and # after backspaces" {
    const s = "a##";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a## and  after backspaces" {
    const s = "a##";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#b and b after backspaces" {
    const s = "a#b";
    const t = "b";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#b and a after backspaces" {
    const s = "a#b";
    const t = "a";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare abc and abc after backspaces" {
    const s = "abc";
    const t = "abc";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare abc and abd after backspaces" {
    const s = "abc";
    const t = "abd";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab#c and ab#c after backspaces" {
    const s = "ab#c";
    const t = "ab#c";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab##c and c after backspaces" {
    const s = "ab##c";
    const t = "c";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#b#c# and  after backspaces" {
    const s = "a#b#c#";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#b#c#d and d after backspaces" {
    const s = "a#b#c#d";
    const t = "d";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#b#c#d and e after backspaces" {
    const s = "a#b#c#d";
    const t = "e";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare #a#b# and  after backspaces" {
    const s = "#a#b#";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare bxj##tw and bxj##tw after backspaces" {
    const s = "bxj##tw";
    const t = "bxj##tw";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare bxj##tw and bxk##tw after backspaces" {
    const s = "bxj##tw";
    const t = "bxk##tw";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare xywrrmp and xywrrmu after backspaces" {
    const s = "xywrrmp";
    const t = "xywrrmu";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare xywrrmp and xywrrmp after backspaces" {
    const s = "xywrrmp";
    const t = "xywrrmp";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a###b and b after backspaces" {
    const s = "a###b";
    const t = "b";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a###b and a after backspaces" {
    const s = "a###b";
    const t = "a";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare #### and  after backspaces" {
    const s = "####";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare #### and #### after backspaces" {
    const s = "####";
    const t = "####";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#### and # after backspaces" {
    const s = "a####";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab#### and ## after backspaces" {
    const s = "ab####";
    const t = "##";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare nzp#o#g and b#nzp#o#g after backspaces" {
    const s = "nzp#o#g";
    const t = "b#nzp#o#g";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare bbbextm and bbb#extm after backspaces" {
    const s = "bbbextm";
    const t = "bbb#extm";
    const expected = false;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare ab#c# and a after backspaces" {
    const s = "ab#c#";
    const t = "a";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare a#a#a# and  after backspaces" {
    const s = "a#a#a#";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare abc## and a after backspaces" {
    const s = "abc##";
    const t = "a";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare abc### and  after backspaces" {
    const s = "abc###";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare  and # after backspaces" {
    const s = "";
    const t = "#";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
test "compare # and  after backspaces" {
    const s = "#";
    const t = "";
    const expected = true;
    const allocator = std.testing.allocator;
    const actual = backspaceCompare(allocator, s, t);
    try expectEqual(expected, actual);
}
