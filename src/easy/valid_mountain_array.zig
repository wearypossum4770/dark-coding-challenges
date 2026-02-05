const std = @import("std");

pub fn validMountainArray(comptime T: type, arr: []const T) bool {
    var count: usize = 1;

    while (count < arr.len and arr[count] > arr[count - 1]) count += 1;

    if (count == 1 or count == arr.len) return false;
    while (count < arr.len and arr[count] < arr[count - 1]) count += 1;
    return count == arr.len;
}
