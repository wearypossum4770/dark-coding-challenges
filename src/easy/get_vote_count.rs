#[derive(Debug)]
pub struct VoteCount {
    upvotes: i32,
    downvotes: i32,
}
pub fn get_vote_count(vote: VoteCount) -> i32 {
    let VoteCount { upvotes, downvotes } = vote;
    upvotes - downvotes
}
#[cfg(test)]
mod tests {
    use super::{get_vote_count, VoteCount};
    #[test]
    fn test_get_vote_count() {
        assert_eq!(
            get_vote_count(VoteCount {
                upvotes: 13,
                downvotes: 0
            }),
            13
        );
        assert_eq!(
            get_vote_count(VoteCount {
                upvotes: 2,
                downvotes: 33
            }),
            -31
        );
        assert_eq!(
            get_vote_count(VoteCount {
                upvotes: 132,
                downvotes: 132
            }),
            0
        );
        assert_eq!(
            get_vote_count(VoteCount {
                upvotes: 0,
                downvotes: 0
            }),
            0
        );
        assert_eq!(
            get_vote_count(VoteCount {
                downvotes: 4,
                upvotes: 1
            }),
            -3
        );
    }
}
