export type VoteCount = {
    upvotes: number;
    downvotes: number;
};
export const getVoteCount = ({ upvotes, downvotes }: VoteCount) =>
    upvotes - downvotes;
