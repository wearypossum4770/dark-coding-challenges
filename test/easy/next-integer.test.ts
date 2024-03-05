import { describe, test, expect } from "bun:test";
import { nextInteger } from "~/easy/next-integer";
describe("Next Integer", () => {
    test.each([
[2, 3, "2 plus 1 equals 3."],
[-9, -8, "-8 plus 1 equals -9."],
[0, 1, "0 plus 1 equals 1."],
[999, 1000, "999 plus 1 equals 1000."],
[73, 74, "73 plus 1 equals 74."],
    ])("the next integer after %d is %ds", (strs, output) => {
        const result = nextInteger(strs);
        expect(result).toStrictEqual(output);
    });
});
