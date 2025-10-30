import { describe, test, expect } from "bun:test";
import { sortArrayByParity } from "@/src/easy/sort-array-by-parity";
describe("\n\tFeature: Sort Array by Parity", () => {
    test.each([
        [
            [3, 1, 2, 4],
            [2, 4, 1, 3],
        ],
        [
            [0, 1, 2],
            [0, 2, 1],
        ],
        [[0], [0]],
    ])(
        "\n\tGiven: the array %p.\n\tThen: when sorted by even/odd parity it is %p",
        (inputs: number[], output: number[]) => {
            const result = sortArrayByParity(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
