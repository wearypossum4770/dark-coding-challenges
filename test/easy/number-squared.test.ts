import { describe, test, expect } from "bun:test";
import { numberSquared } from "~/easy/number-squared";
describe("Square a numer", () => {
    test.each([
        [10, 100, "Expected 100"],
        [69, 4761, "Expected 4761"],
        [666, 443556, "Expected 443556"],
        [-21, 441, "Expected 441"],
        [21, 441, "Expected 441"],
    ])("%d squared is %d", (strs, output) => {
        const result = numberSquared(strs);
        expect(result).toStrictEqual(output);
    });
});
