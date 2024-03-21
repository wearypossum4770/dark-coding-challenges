import { describe, test, expect } from "bun:test";
import { plusMinus } from "~/easy/plus-minus";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = plusMinus(strs);
        expect(result).toStrictEqual(output);
    });
});
