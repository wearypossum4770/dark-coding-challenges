import { describe, test, expect } from "bun:test";
import { plusOne } from "@/src/easy/plus-one";
describe("plusOne", () => {
    test.each([
        [
            [4, 3, 2, 1],
            [4, 3, 2, 2],
        ],
        [
            [1, 2, 3],
            [1, 2, 4],
        ],
        [[9], [1, 0]],
        [
            [9, 9],
            [1, 0, 0],
        ],
        [[0], [1]],
        [[5], [6]],
        [
            [9, 9, 9, 9],
            [1, 0, 0, 0, 0],
        ],
        [
            [9, 9, 8],
            [9, 9, 9],
        ],
        [
            [1, 0, 0],
            [1, 0, 1],
        ],
        [
            [8, 9, 9],
            [9, 0, 0],
        ],
        [
            [0, 9],
            [1, 0],
        ],
        [
            [1, 9, 9],
            [2, 0, 0],
        ],
        [
            [9, 9, 9, 9, 9],
            [1, 0, 0, 0, 0, 0],
        ],
    ])(
        "\n\tGiven: the number %p.\n\tWhen: one is added.\n\tThen: it will be %p.",
        (inputs: number[], output: number[]) => {
            const result = plusOne(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
