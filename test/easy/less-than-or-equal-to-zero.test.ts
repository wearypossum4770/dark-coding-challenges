import { describe, test, expect } from "bun:test";
import { lessThanOrEqualToZero } from "~/easy/less-than-or-equal-to-zero";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = lessThanOrEqualToZero(strs);
        expect(result).toStrictEqual(output);
    });
});
