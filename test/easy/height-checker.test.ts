import { describe, test, expect } from "bun:test";
import { heightChecker } from "@/src/easy/height-checker";
describe("\n\tFeature: Height Checker", () => {
    test.each([
        [[1, 1, 4, 2, 1, 3], 3],
        [[5, 1, 2, 3, 4], 5],
        [[1, 2, 3, 4, 5], 0],
        [
            [
                10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4,
                7, 7,
            ],
            22,
        ],
    ])(
        "\n\tGiven: the array %p.\n\tThen: it has %i out of order",
        (inputs: number[], output: number) => {
            const result = heightChecker(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
