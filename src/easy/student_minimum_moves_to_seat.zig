const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn studentMinimumMovesToSeat(comptime T: type, allocator: Allocator, seats: []const T, students: []const T) ?u32 {
    var moves: u32 = 0;
    const chairs = allocator.dupe(T, seats) catch return null;
    const children = allocator.dupe(T, students) catch return null;
    defer {
        allocator.free(chairs);
        allocator.free(children);
    }
    std.mem.sort(T, chairs, {}, std.sort.asc(T));
    std.mem.sort(T, children, {}, std.sort.asc(T));

    for (chairs, 0..) |seat, i| {
        moves += @abs(seat - children[i]);
    }
    return moves;
}
