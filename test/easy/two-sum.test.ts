import { describe, test, expect } from "bun:test";
import { twoSum } from "~/easy/two-sum";

describe("Calculate two sum", () => {
    test.each([
        [[2, 7, 11, 15], 9, [0, 1]],
        [[3, 2, 4], 6, [1, 2]],
        [[3, 3], 6, [0, 1]],
    ])(
        "Given a list of values %o with a target of %i",
        async (nums: number[], target: number, output: number[]) => {
            const result = twoSum(nums, target);
            expect(result).toStrictEqual(output);
        },
    );
});
