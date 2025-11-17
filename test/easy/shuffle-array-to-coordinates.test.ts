import { describe, test, expect } from "bun:test";
import { shuffleArrayToCoordinates } from "@/src/easy/shuffle-array-to-coordinates";
describe("shuffleArrayToCoordinates", () => {
    test.each([
        [[2, 5, 1, 3, 4, 7], 3, [2, 3, 5, 4, 1, 7]],
        [[1, 2, 3, 4, 4, 3, 2, 1], 4, [1, 4, 2, 3, 3, 2, 4, 1]],
        [[1, 1, 2, 2], 2, [1, 2, 1, 2]],
    ])(
        "\n\tGiven: the array %p,\n\tAnd: the shuffle value of %i.\n\tThen: it will be %p after the shuffle.",
        (nums: number[], n: number, output: number[]) => {
            const result = shuffleArrayToCoordinates(nums, n);
            expect(result).toStrictEqual(output);
        },
    );
});
