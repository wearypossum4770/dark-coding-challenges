import { describe, test, expect } from "bun:test";
import { singleNumber } from "@/src/easy/single-number";
describe("Feature: Find non-repeating number in an array", () => {
    test.each([
        [[2, 2, 1], 1],
        [[4, 1, 2, 1, 2], 4],
        [[1], 1],
    ])(
        "\n\tGiven: a list of numbers %p.\nThen: the non-repeating number is %i",
        (nums: number[], output: number) => {
            const result = singleNumber(nums);
            expect(result).toStrictEqual(output);
        },
    );
});
