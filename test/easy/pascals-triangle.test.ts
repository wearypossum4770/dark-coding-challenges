import { describe, test, expect } from "bun:test";
import { pascalsTriangle } from "@/src/easy/pascals-triangle";
describe("pascalsTriangle", () => {
    test.each([
        [1, [[1]]],
        [2, [[1], [1, 1]]],
        [3, [[1], [1, 1], [1, 2, 1]]],
        [4, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]],
        [5, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]],
        [
            6,
            [
                [1],
                [1, 1],
                [1, 2, 1],
                [1, 3, 3, 1],
                [1, 4, 6, 4, 1],
                [1, 5, 10, 10, 5, 1],
            ],
        ],
    ])(
        "\n\tGiven: the number %i.\n\tThen: pascals triangle will be %p",
        (inputs: number, output: number[][]) => {
            const result = pascalsTriangle(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
