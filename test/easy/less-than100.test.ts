import { describe, test, expect } from "bun:test";
import { lessThan100 } from "~/easy/less-than100";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = lessThan100(strs);
        expect(result).toStrictEqual(output);
    });
});
