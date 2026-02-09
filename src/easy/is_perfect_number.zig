const std = @import("std");

pub fn isPerfectNumber(comptime T: type, n: T) bool {
    if (n <= 1) return false;
    var total: T = 1;
    var i: T = 2;
    while (i * i < n) : (i += 1) {
        if (@mod(n, i) == 0) {
            total += i;
            const other: T = @divFloor(n, i);
            if (other != i) {
                total += other;
            }
        }
    }
    if (i * i == n and n != i) {
        total += i;
    }
    return total == n;
}
