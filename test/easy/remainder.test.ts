import { describe, test, expect } from "bun:test";
import { remainder, divisibleByFive } from "~/easy/remainder";
describe("Find the remainder of two numbers", () => {
    test.each([
        [7, 2, 1],
        [3, 4, 3],
        [-9, 45, -9],
        [5, 5, 0],
    ])("the remainder of %d and %d is %d", (a, b, output) => {
        const result = remainder(a, b);
        expect(result).toStrictEqual(output);
    });
});

describe("Is number divisible by 5", () => {
    test.each([
        [7, false],
        [5, true],
        [15, true],
        [33, false],
        [-18, false],
        [999, false],
        [2, false],
    ])("the number %d is divisible by 5 %o", (num: number, output: boolean) => {
        const result = divisibleByFive(num);
        expect(result).toBe(output);
    });
});
