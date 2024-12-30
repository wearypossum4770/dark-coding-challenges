// https://www.hackerrank.com/profile/wearypossum4770
const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;

const CompareOrder = struct {
    fn compare(_: void, lhs: [2]i32, rhs: [2]i32) bool {
        if (lhs[0] < rhs[0]) return true;
        if (lhs[0] > rhs[0]) return false;
        return lhs[1] < rhs[1];
    }
};
pub fn jimOrders(allocator: std.mem.Allocator, orders: []const [2]i32) ![]i32 {
    // Assign
    const count = orders.len;

    // Allocate
    var queue = try allocator.alloc([2]i32, count);
    var result = try allocator.alloc(i32, count);

    // Aftermath
    defer allocator.free(queue);

    for (orders, 0..) |order, index| {
        const position: i32 = @intCast(index);
        queue[index] = .{ order[0] + order[1], position + 1 };
    }

    // Sort queue based on the total time and original position
    std.mem.sort([2]i32, queue, {}, CompareOrder.compare);

    for (queue, 0..) |completion_time, index| {
        result[index] = completion_time[1];
    }

    return result;
}
test "all orders done at same time" {
    const allocator = std.testing.allocator;
    const orders = [_][2]i32{ .{ 1, 2 }, .{ 2, 3 }, .{ 3, 3 } };
    const output = [_]i32{ 1, 2, 3 };
    const result = try jimOrders(allocator, orders[0..]);
    defer allocator.free(result);
    try expectEqualSlices(i32, result, output[0..]);
}

test "unsorted orders with 5 items should be completed in order" {
    const allocator = std.testing.allocator;
    const orders = [_][2]i32{ .{ 8, 1 }, .{ 4, 2 }, .{ 5, 6 }, .{ 3, 1 }, .{ 4, 3 } };
    const output = [_]i32{ 4, 2, 5, 1, 3 };
    const result = try jimOrders(allocator, orders[0..]);
    defer allocator.free(result);
    try expectEqualSlices(i32, result, output[0..]);
}

test "sorted orders with 2 items should be completed in order" {
    const allocator = std.testing.allocator;
    const orders = [_][2]i32{ .{ 1, 1 }, .{ 1, 1 } };
    const output = [_]i32{ 1, 2 };
    const result = try jimOrders(allocator, orders[0..]);
    defer allocator.free(result);
    try expectEqualSlices(i32, result, output[0..]);
}
test "sorted orders with 1 items should be completed in order" {
    const allocator = std.testing.allocator;
    const orders = [_][2]i32{.{ 1, 1 }};
    const output = [_]i32{1};
    const result = try jimOrders(allocator, orders[0..]);
    defer allocator.free(result);
    try expectEqualSlices(i32, result, output[0..]);
}
