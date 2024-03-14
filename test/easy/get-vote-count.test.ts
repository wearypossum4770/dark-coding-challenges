import { describe, test, expect } from "bun:test";
import { getVoteCount } from "~/easy/get-vote-count";
describe("Get Vote Score", () => {
    test.each([
        [{ upvotes: 13, downvotes: 0 }, 13],
        [{ upvotes: 2, downvotes: 33 }, -31],
        [{ upvotes: 132, downvotes: 132 }, 0],
        [{ upvotes: 0, downvotes: 0 }, 0],
        [{ downvotes: 4, upvotes: 1 }, -3],
    ])("given a vote object %o the score will be %d", (votes, output) => {
        const result = getVoteCount(votes);
        expect(result).toStrictEqual(output);
    });
});
