import { describe, test, expect } from "bun:test";
import { palindromicNumber } from "~/easy/palindromic-number";
describe("Palindromic Number", () => {
    test.each([
        [121, true],
        [-121, false],
        [10, false],
    ])("Check if number(positive) %i is palindrome %o", (strs, output) => {
        const result = palindromicNumber(strs);
        expect(result).toStrictEqual(output);
    });
});
