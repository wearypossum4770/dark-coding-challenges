import { describe, test, expect } from "bun:test";
import { plusOne } from "~/easy/plus-one";
describe("Add one to a large integer", () => {
    test.each([
        [
            [1, 2, 3],
            [1, 2, 4],
        ],
        [
            [4, 3, 2, 1],
            [4, 3, 2, 2],
        ],
        [[9], [1, 0]],
        [[0], [1]],
        [
            [1, 8],
            [1, 9],
        ],
        [
            [1, 9],
            [2, 0],
        ],
        [
            [9, 9],
            [1, 0, 0],
        ],
    ])(
        "Given a large integer represented as %o add one to the value to equal %o",
        async (digits, output) => {
            const result = plusOne(digits);
            expect(result).toStrictEqual(output);
        },
    );
});
