import { describe, test, expect } from "bun:test";
import { sortArrayByParityTwo } from "@/src/easy/sort-array-by-parity-two";
describe("sortArrayByParityTwo", () => {
    test.each([
        [
            [4, 2, 5, 7],
            [4, 5, 2, 7],
        ],
        [
            [2, 3],
            [2, 3],
        ],
    ])(
        "\n\tGiven: the array %p.\n\tThen: it is %p when sorted by parity.",
        (inputs: number[], output: number[]) => {
            const result = sortArrayByParityTwo(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
