import { describe, test, expect } from "bun:test";
import { majorityElement } from "@/src/easy/majority-element";
describe("\n\tFeature: Majority Element", () => {
    test.each([
        [[2, 1, 2], 2],
        [[100], 100],
        [[2, 1, 1], 1],
        [[2,2,1,1,1,2,2], 2],
        [[3,2,3], 3],
        [["A", "B", "B", "B", "A", "A"], null],
        [["B", "B", "B"], "B"],
        [["A", "B", "B"], "B"],
        [["A", "A", "B"], "A"],
        [["A", "A", "A", "B", "C", "A"], "A"],
        [["B", "A", "B", "B", "C", "A", "B", "B"], "B"],
        [["A", "B", "B", "A", "C", "C"], null],
        [["A", "B"], null],
        [["A"], "A"],
        [[], null],
    ])(
        "\n\tGiven an array %p.\n\tThen: find the element count greater than half its length. %d",
        (inputs: Array<number | string>, output: number | null) => {
            const result = majorityElement(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
