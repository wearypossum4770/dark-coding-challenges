import { describe, test, expect } from "bun:test";
import { cubedNumber } from "~/easy/cubed-number";
describe("Cube a number", () => {
    test.each([
        [2, 8],
        [3, 27],
        [4, 64],
        [5, 125],
        [10, 1000],
    ])("the value %d cubed is %d", (strs, output) => {
        const result = cubedNumber(strs);
        expect(result).toStrictEqual(output);
    });
});
