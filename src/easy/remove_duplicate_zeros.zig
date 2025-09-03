const std = @import("std");
const expectEqualSlices = std.testing.expectEqualSlices;

const debug = std.debug.print;

pub fn removeDuplicateZeros(comptime T: type, arr: []T) void {
    const right: usize = arr.len - 1;
    var left: usize = 0;

    while (left <= right) : (left += 1) {
        var r = right;
        if (arr[left] == 0) {
            while (r > left) : (r -= 1) {
                arr[r] = arr[r - 1];
            }
            left += 1;
        }
    }
}

test "remove duplicate zeros in place [1,0,2,3,0,4,5,0]" {
    var nums = [_]i32{ 1, 0, 2, 3, 0, 4, 5, 0 };
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{ 1, 0, 0, 2, 3, 0, 0, 4 };
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place [1,2,3]" {
    var nums = [_]i32{ 1, 2, 3 };
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{ 1, 2, 3 };
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place all zeros [0,0,0]" {
    var nums = [_]i32{ 0, 0, 0 };
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{ 0, 0, 0 };
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place single element zero" {
    var nums = [_]i32{0};
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{0};
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place single element nonzero" {
    var nums = [_]i32{7};
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{7};
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place zero at end [1,2,0]" {
    var nums = [_]i32{ 1, 2, 0 };
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{ 1, 2, 0 };
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}

test "remove duplicate zeros in place scattered zeros [0,1,0,2,0,3]" {
    var nums = [_]i32{ 0, 1, 0, 2, 0, 3 };
    removeDuplicateZeros(@TypeOf(nums[0]), &nums);
    const expected = [_]i32{ 0, 0, 1, 0, 0, 2 };
    try expectEqualSlices(@TypeOf(nums[0]), &expected, &nums);
}
