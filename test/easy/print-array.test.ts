import { describe, test, expect } from "bun:test";
import { printArray } from "~/easy/print-array";
describe("Print a range of numbers", () => {
    test.each([
        [1, [1]],
        [2, [1, 2]],
        [3, [1, 2, 3]],
        [4, [1, 2, 3, 4]],
        [5, [1, 2, 3, 4, 5]],
        [6, [1, 2, 3, 4, 5, 6]],
        [7, [1, 2, 3, 4, 5, 6, 7]],
        [8, [1, 2, 3, 4, 5, 6, 7, 8]],
        [9, [1, 2, 3, 4, 5, 6, 7, 8, 9]],
        [10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]],
    ])("given the size %d the result should be %o", (size, output) => {
        const result = printArray(size);
        expect(result).toStrictEqual(output);
    });
});
