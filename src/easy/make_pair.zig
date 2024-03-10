const expectEqual = @import("std").testing.expectEqual;

pub fn makePair(a: u32, b: u32) [2]u32 {
	var pair: [2]u32 = undefined;
	pair[0] = a;
	pair[1] = b;
	return pair;
}
test "Return items in a pair" {
try expectEqual(makePair(1, 2), [2]u32{1, 2});
try expectEqual(makePair(21, 82), [2]u32{21, 82});
try expectEqual(makePair(4213, 526), [2]u32{4213, 526});

}