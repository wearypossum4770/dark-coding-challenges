const std = @import("std");

pub fn smallestEvenMultiple(n: u32) u32 {
    if (@mod(n, 2) != 0) return n * 2;
    return n;
}
