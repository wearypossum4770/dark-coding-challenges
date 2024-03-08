import { describe, test, expect } from "bun:test";
import { remainder } from "~/easy/remainder";
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
