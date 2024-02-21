import { describe, test, expect } from "bun:test";
import { findDigits } from "~/easy/find-digits";
describe("Hacker Rank Find Digits", () => {
    test.each([
        [124, 3],
        [111, 3],
        [12, 2],
        [1012, 3],
        [123456789, 3],
        [114108089, 3],
        [110110015, 6],
        [121, 2],
        [33, 2],
        [44, 2],
        [55, 2],
        [66, 2],
        [77, 2],
        [88, 2],
        [106108048, 5],
    ])("The number: %i has %i divisible digits", (digit, output) => {
        const result = findDigits(digit);
        expect(result).toStrictEqual(output);
    });
});
