const std = @import("std");

const Allocator = std.mem.Allocator;

pub fn arrayStack(comptime T: type, allocator: Allocator, target: []const T, n: T) ?[][:0]const u8 {
    var result = allocator.alloc([:0]const u8, n * 2) catch return null;
    var index: usize = 0;
    var position: usize = 0;
    var counter: T = 1;
    while (index < target.len) : (counter += 1) {
        result[position] = "Push"[0..4 :0];
        position += 1;
        if (target[index] == counter) {
            index += 1;
        } else {
            result[position] = "Pop"[0..3 :0];
            position += 1;
        }
        if (counter > n) break;
    }
    result = allocator.realloc(result, position) catch result[0..position];
    result.len = position;
    return result;
}
