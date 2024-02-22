import { describe, test, expect } from "bun:test";
import { summation } from "~/easy/summation";
describe("Testing Setup", () => {
    test.each([
        [1, 3, 4],
        [3, 4, 7],
    ])("Summation of %i and %i equals %i", (addendOne, addendTwo, output) => {
        const result = summation(addendOne, addendTwo);
        expect(result).toStrictEqual(output);
    });
});
