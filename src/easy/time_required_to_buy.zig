const std = @import("std");

const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

const Person = struct {
    tickets: i32,
    isOriginal: bool,
    pub fn decrement(self: *Person) void {
        if (self.tickets > 0) {
            self.tickets -= 1;
        }
    }
};

pub fn timeRequiredToBuy(comptime T: type, allocator: Allocator, tickets: []const T, k: usize) ?u32 {
    var elapsedTime: u32 = 0;
    var queue = ArrayList(Person).init(allocator);
    defer queue.deinit();

    for (tickets, 0..) |ticket, i| {
        queue.append(Person{ .tickets = ticket, .isOriginal = i == k }) catch return null;
    }
    while (queue.capacity > 0) {
        var person = queue.orderedRemove(0);
        if (person.tickets > 0) {
            person.decrement();
            elapsedTime += 1;
        }
        if (person.isOriginal and person.tickets == 0) break;
        if (person.tickets > 0) queue.append(person) catch return null;
    }
    return elapsedTime;
}
