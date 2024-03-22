import { describe, test, expect } from "bun:test";
import { plusMinus } from "~/easy/plus-minus";
describe("Plus Minus", () => {
    test.each([
        [
            [0, 0, -1, 1, 1],
            [0.4, 0.2, 0.4],
        ],
        [
            [-4, 3, -9, 0, 4, 1],
            [0.5, 0.333333, 0.166667],
        ],
        [
            [1, -2, -7, 9, 1, -8, -5],
            [0.428571, 0.571429, 0.0],
        ],
        [
            [0, 4, -3, 3, -6],
            [0.4, 0.4, 0.2],
        ],
        [
            [
                55, 48, 48, 45, 91, 97, 45, 1, 39, 54, 36, 6, 19, 35, 66, 36,
                72, 93, 38, 21, 65, 70, 36, 63, 39, 76, 82, 26, 67, 29, 24, 82,
                62, 53, 1, 50, 47, 65, 67, 19, 66, 90, 77,
            ],
            [1.0, 0.0, 0.0],
        ],
        [
            [0, 100, 35, 0, 94, 40, 42, 87, 59, 0],
            [0.7, 0.0, 0.3],
        ],
        [
            [1, 2, 3, -1, -2, -3, 0, 0],
            [0.375, 0.375, 0.25],
        ],
    ])("The array %o has the following ratios %o", (sample, output) => {
        const result = plusMinus(sample);
        expect(result).toStrictEqual(output);
    });
});
