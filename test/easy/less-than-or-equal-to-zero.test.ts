import { describe, test, expect } from "bun:test";
import { lessThanOrEqualToZero } from "~/easy/less-than-or-equal-to-zero";
describe("Less than equal to zero", () => {
    test.each([
        [5, false],
        [0, true],
        [-5, true],
    ])(
        "The number %d meets requirements %o",
        (num: number, output: boolean) => {
            const result = lessThanOrEqualToZero(num);
            expect(result).toStrictEqual(output);
        },
    );
});
