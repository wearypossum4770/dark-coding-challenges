import { describe, test, expect } from "bun:test";
import { removeDuplicateZeros } from "@/src/easy/remove-duplicate-zeros";
describe("removeDuplicateZeros", () => {
    test.each([
        [
            [1, 0, 2, 3, 0, 4, 5, 0],
            [1, 0, 0, 2, 3, 0, 0, 4],
        ],
        [
            [1, 2, 3],
            [1, 2, 3],
        ],
        [
            [0, 0, 0],
            [0, 0, 0],
        ],
        [[0], [0]],
        [[7], [7]],
        [
            [1, 2, 0],
            [1, 2, 0],
        ],
        [
            [0, 1, 0, 2, 0, 3],
            [0, 0, 1, 0, 0, 2],
        ],
    ])(
        "\n\tGiven: the array %p.\n\tWhen: zeros are duplicated in-place\n\tAnd: last element is dropped.\n\tThen: it will be %p",
        (inputs: number[], output: number[]) => {
            removeDuplicateZeros(inputs);
            expect(inputs).toStrictEqual(output);
        },
    );
});
