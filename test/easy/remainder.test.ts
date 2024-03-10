import { describe, test, expect } from "bun:test";
import {
    remainder,
    divisibleByFive,
    divisibleBy100,
    dividesEvenly,
} from "~/easy/remainder";
describe("Find the remainder of two numbers", () => {
    test.each([
        [7, 2, 1],
        [3, 4, 3],
        [-9, 45, -9],
        [5, 5, 0],
    ])("the remainder of %d and %d is %d", async (a, b, output) => {
        const result = remainder(a, b);
        expect(result).toStrictEqual(output);
    });
});
describe("Divides evenly", () => {
    test.each([
        [98, 7, true],
        [87, 49, false],
        [34, 14, false],
        [78, 6, true],
        [30, 4, false],
        [87, 73, false],
        [74, 7, false],
        [87, 29, true],
        [48, 24, true],
        [99, 20, false],
        [98, 49, true],
        [100, 6, false],
        [64, 4, true],
        [70, 35, true],
        [38, 38, true],
        [29, 3, false],
        [20, 8, false],
        [66, 50, false],
        [95, 1, true],
        [58, 2, true],
    ])(
        "the numbers %d and %d are divisible",
        async (numerator: number, denominator: number, output: boolean) => {
            const result = dividesEvenly(numerator, denominator);
            expect(result).toBe(output);
        },
    );
});
describe("Is divisible by 100", () => {
    test.each([
        [1, false, "LEFT BLANK INTENTIONALLY"],
        [100, true, "LEFT BLANK INTENTIONALLY"],
        [1000, true, "LEFT BLANK INTENTIONALLY"],
        [111000, true, "LEFT BLANK INTENTIONALLY"],
        [-1, false, "Don't forget negatives."],
        [0, true, "Cover the 0 cases."],
        [-100, true, "-100 is divisible by 100."],
    ])(
        "the number %d is divisible by 100 %o",
        (numerator: number, output: boolean, _message?: string) => {
            const result = divisibleBy100(numerator);
            expect(result).toBe(output);
        },
    );
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
    ])(
        "the number %d is divisible by 5 %o",
        async (num: number, output: boolean) => {
            const result = divisibleByFive(num);
            expect(result).toBe(output);
        },
    );
});
