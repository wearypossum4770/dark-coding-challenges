import { describe, test, expect } from "bun:test";
import { makesTen } from "~/easy/makes-ten";
describe("Two makes ten", () => {
    test.each([
        [9, 10, true],
        [9, 9, false],
        [1, 9, true],
        [10, 1, true],
        [10, 10, true],
        [8, 2, true],
        [8, 3, false],
        [10, 42, true],
        [12, -2, true],
        // Author : serf
    ])("if %d or %d or its sum makes 10 %o", (a, b, output) => {
        const result = makesTen(a, b);
        expect(result).toStrictEqual(output);
    });
});
