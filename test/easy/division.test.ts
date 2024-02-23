import { describe, test, expect } from "bun:test";
import { division } from "~/easy/division";
describe("Setup Division", () => {
    test.each([
        [12, 4, 3],
        [2, 0, Infinity],
    ])("The quotient of %i and %i is %i", (dividend, divisor, quotient) => {
        const result = division(dividend, divisor);
        expect(result).toStrictEqual(quotient);
    });
});
