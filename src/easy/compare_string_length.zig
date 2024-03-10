const expectEqual = @import("std").testing.expectEqual;

pub fn compareStringLength(a: []const u8, b: []const u8) bool {
	return a.len == b.len;
}
test "Do strings have same length" {
try expectEqual(compareStringLength("AB", "CD"), true);
try expectEqual(compareStringLength("ABC", "DE"), false);
try expectEqual(compareStringLength("hello", "edabit"), false);
try expectEqual(compareStringLength("meow", "woof"), true);
try expectEqual(compareStringLength("jrnvjrnnt", "cvjknfjvmfvnfjn"), false);
try expectEqual(compareStringLength("jkvnjrt", "krnf"), false);
try expectEqual(compareStringLength("Facebook", "Snapchat"), true);
}