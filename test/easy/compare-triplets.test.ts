import { describe, test, expect } from "bun:test";
import { compareTriplets } from "~/easy/compare-triplets";
describe("Compare triplets", () => {
    test.each([
        [
            [5, 6, 7],
            [3, 6, 10],
            [1, 1],
        ],
        [
            [1, 2, 3],
            [1, 2, 3],
            [0, 0],
        ],
        [
            [6, 8, 12],
            [7, 9, 15],
            [0, 3],
        ],
        [
            [10, 15, 20],
            [5, 6, 7],
            [3, 0],
        ],
        [
            [10, 12, 50],
            [20, 20, 10],
            [1, 2],
        ],
        [
            [10, 20, 30],
            [5, 5, 50],
            [2, 1],
        ],
        [
            [20, 20, 30],
            [20, 20, 50],
            [0, 1],
        ],
        [
            [17, 28, 30],
            [99, 16, 8],
            [2, 1],
        ],
    ])(
        "The winner of the cores between alice %s and bob %s is %o",
        async (alice, bob, output) => {
            const result = compareTriplets(alice, bob);
            expect(result).toStrictEqual(output);
        },
    );
});
