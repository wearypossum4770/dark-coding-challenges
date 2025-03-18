import { describe, test, expect } from "bun:test";
import { twoSum } from "@/src/easy/two-sum";
describe("twoSum: Calculate two sum", () => {
    test.each([
        [[2, 7, 11, 15], 9, [0, 1]],
        [[3, 2, 4], 6, [1, 2]],
        [[3, 3], 6, [0, 1]],
        [[3, 2, 3], 6, [0, 2]],
        [[2, 5, 5, 11], 10, [1, 2]],
        [[0, 4, 3, 0], 0, [0, 3]],
        [[-3, 4, 3, 90], 0, [0, 2]],
        [[-1, -2, -3, -4, -5], -8, [2, 4]],
        [[5, 75, 25], 100, [1, 2]],
        [[2_222_222, 2_222_222], 4_444_444, [0, 1]],
        [[1, 6142, 8192, 10239], 18431, [2, 3]],
        [[-10, -1, -18, -19], -19, [1, 2]],
        [[-10, 7, 19, 15], 9, [0, 2]],
        [[0, 3, -3, 4, -1], -1, [0, 4]],
        [[-18, 12, 3, 0], -6, [0, 1]],
        [[1, 3, 4, 2], 6, [2, 3]],
        [[1, 3, 5, 2, 8, -2], 6, [0, 2]],
    ])(
        "Given a list of values %p with a target of %i returns %p",
        (nums: number[], target: number, output: number[]) => {
            const result = twoSum(nums, target);
            expect(result).toStrictEqual(output);
        },
    );
});
