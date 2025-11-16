import { describe, test, expect } from "bun:test";
import { getArrayConcatenation } from "@/src/easy/get-array-concatenation";
describe("getArrayConcatenation", () => {
    test.each([
        [
            [1, 2, 1],
            [1, 2, 1, 1, 2, 1],
        ],
        [
            [1, 3, 2, 1],
            [1, 3, 2, 1, 1, 3, 2, 1],
        ],
        [[1], [1, 1]],
        [[1000], [1000, 1000]],
        [
            [1, 1, 1],
            [1, 1, 1, 1, 1, 1],
        ],
        [
            [2, 4, 6],
            [2, 4, 6, 2, 4, 6],
        ],
        [
            [5, 10],
            [5, 10, 5, 10],
        ],
        [
            [0, 1, 0],
            [0, 1, 0, 0, 1, 0],
        ],
        [
            [1, 2, 3, 2, 1],
            [1, 2, 3, 2, 1, 1, 2, 3, 2, 1],
        ],
    ])(
        "\n\tGiven: the array %p.\n\tThen: its double and concatenate will be %p.",
        (inputs: number[], output: number[]) => {
            const result = getArrayConcatenation(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
