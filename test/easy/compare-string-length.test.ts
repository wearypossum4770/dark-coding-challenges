import { describe, test, expect } from "bun:test";
import { compareStringLength } from "~/easy/compare-string-length";
describe("Compare string length", () => {
    test.each([
        ["AB", "CD", true],
        ["ABC", "DE", false],
        ["hello", "edabit", false],
        ["meow", "woof", true],
        ["jrnvjrnnt", "cvjknfjvmfvnfjn", false],
        ["jkvnjrt", "krnf", false],
        ["Facebook", "Snapchat", true],
    ])("strings %s and %s have the same length %o", (a, b, output) => {
        const result = compareStringLength(a, b);
        expect(result).toStrictEqual(output);
    });
});
