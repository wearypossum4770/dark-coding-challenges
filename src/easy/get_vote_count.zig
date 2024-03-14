const expectEqual = @import("std").testing.expectEqual;
const VoteCount = struct {
    upvotes: i32,
    downvotes: i32,
};
pub fn getVoteCount(votes: VoteCount) i32 {
    const upvotes = votes.upvotes;
    const downvotes = votes.downvotes;
    return upvotes - downvotes;
}
test "Get score from vote count" {
    try expectEqual(getVoteCount(VoteCount{ .upvotes = 13, .downvotes = 0 }), 13);
    try expectEqual(getVoteCount(VoteCount{ .upvotes = 2, .downvotes = 33 }), -31);
    try expectEqual(getVoteCount(VoteCount{ .upvotes = 132, .downvotes = 132 }), 0);
    try expectEqual(getVoteCount(VoteCount{ .upvotes = 0, .downvotes = 0 }), 0);
    try expectEqual(getVoteCount(VoteCount{ .downvotes = 4, .upvotes = 1 }), -3);
}
