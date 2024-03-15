import { describe, test, expect } from "bun:test";
import { cubedNumber, calculateExponent } from "~/easy/cubed-number";

describe("raise a number to a power", () => {
    test.each([
        [5, 5, 3125],
        [3, 3, 27],
        [10, 10, 10000000000],
    ])(
        "raising %d to the %d gives %d",
        (base: number, exponent: number, output: number) => {
            const result = calculateExponent(base, exponent);
            expect(result).toBe(output);
        },
    );
});
describe("Cube a number", () => {
    test.each([
        [2, 8],
        [3, 27],
        [4, 64],
        [5, 125],
        [10, 1000],
    ])("the value %d cubed is %d", (strs, output) => {
        const result = cubedNumber(strs);
        expect(result).toBe(output);
    });
});
