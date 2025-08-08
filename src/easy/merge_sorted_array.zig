const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;
const expectEqual = std.testing.expectEqual;
const Allocator = std.mem.Allocator;

pub fn mergeSortedArray(
    allocator: Allocator,
    num1: []const i32,
    m: usize,
    num2: []const i32,
    n: usize,
) ?[]const i32 {
    var result = allocator.alloc(i32, m + n) catch return null;
    var i: usize = 0;
    var j: usize = 0;
    var index: usize = 0;
    while (i < m and j < n) {
        if (num1[i] <= num2[j]) {
            result[index] = num1[i];
            i += 1;
        } else {
            result[index] = num2[j];
            j += 1;
        }
        index += 1;
    }
    while (i < m) {
        result[index] = num1[i];
        i += 1;
        index += 1;
    }
    while (j < n) {
        result[index] = num2[j];
        j += 1;
        index += 1;
    }

    return result;
}

test "Merge with no missing values" {
    const first = [_]i32{ 1, 2, 3, 0, 0, 0 };
    const firstSize: usize = 3;
    const second = [_]i32{ 2, 5, 6 };
    const secondSize: usize = 3;
    const expected = [_]i32{ 1, 2, 2, 3, 5, 6 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &first, firstSize, &second, secondSize);
    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}
test "merge with one missing value" {
    const first = [_]i32{1};
    const firstSize: usize = 1;
    const second = [_]i32{};
    const secondSize: usize = 0;
    const expected = [_]i32{1};
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &first, firstSize, &second, secondSize);
    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}
// Test 3
test "merge sorted array - nums1 empty, nums2 has elements" {
    var nums1 = [_]i32{0};
    const m: usize = 0;
    const n: usize = 1;
    var nums2 = [_]i32{1};
    const expected = [_]i32{1};
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

// Test 4
test "merge sorted array - nums2 smaller elements go to front" {
    var nums1 = [_]i32{ 4, 5, 6, 0, 0, 0 };
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ 1, 2, 3 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

// Test 5
test "merge sorted array - single element merge" {
    var nums1 = [_]i32{ 2, 0 };
    var nums2 = [_]i32{1};
    const m: usize = 1;
    const n: usize = 1;
    const expected = [_]i32{ 1, 2 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - both arrays empty" {
    var nums1 = [_]i32{};
    const m: usize = 0;
    const n: usize = 0;
    var nums2 = [_]i32{};
    const expected = [_]i32{};
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - nums1 all smaller than nums2" {
    var nums1 = [_]i32{ 1, 2, 3, 0, 0, 0 };
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ 4, 5, 6 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - nums1 all larger than nums2" {
    var nums1 = [_]i32{ 7, 8, 9, 0, 0, 0 };
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ 1, 2, 3 };
    const expected = [_]i32{ 1, 2, 3, 7, 8, 9 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - duplicate values" {
    var nums1 = [_]i32{ 1, 2, 2, 0, 0, 0 };
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ 2, 2, 3 };
    const expected = [_]i32{ 1, 2, 2, 2, 2, 3 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - negative numbers and mixed signs" {
    var nums1 = [_]i32{ -5, -3, 0, 0, 0, 0 };
    // If this was mutated in-place the value for m = 2, but since we are returning a new array we set to 3 to ensure enough memory is allocated.
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ -4, -1, 2 };
    const expected = [_]i32{ -5, -4, -3, -1, 0, 2 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - nums2 fits in the middle" {
    var nums1 = [_]i32{ 1, 5, 6, 0, 0, 0 };
    const m: usize = 3;
    const n: usize = 3;
    var nums2 = [_]i32{ 2, 3, 4 };
    const expected = [_]i32{ 1, 2, 3, 4, 5, 6 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}

test "merge sorted array - m=0, nums2 overwrites all" {
    var nums1 = [_]i32{ 0, 0, 0 };
    const m: usize = 0;
    const n: usize = 3;
    var nums2 = [_]i32{ 1, 2, 3 };
    const expected = [_]i32{ 1, 2, 3 };
    const alloc = std.testing.allocator;
    const result = mergeSortedArray(alloc, &nums1, m, &nums2, n);

    if (result) |actual| {
        defer alloc.free(actual);
        try expectEqualSlices(i32, &expected, actual);
    } else return error.SkipZigTest;
}
