import { describe, test, expect } from "bun:test";
import { removeElement } from "@/src/easy/remove-element";
describe("Feature: Remove Element in Place", () => {
    test.each([
        [[3, 2, 2, 3], 3, 2, [null, 2, 2, null]],
        [[0, 1, 2, 2, 3, 0, 4, 2], 2, 5, [0, 1, 4, 0, 3, null, null, null]],
        [[4, 1, 1, 2, 1, 3], 1, 3, [4, null, null, 2, null, 3]],
    ])(
        "\n\t\tGiven the array %p\n\t\tAnd: a removal values of %p\n\t\tThen: there are %i values left.",
        (
            nums: number[],
            val: number,
            expected: number,
            _actual: Array<number | null>,
        ) => {
            const result = removeElement(nums, val);
            expect(result).toBe(expected);
        },
    );
});
