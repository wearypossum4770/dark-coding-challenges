import { describe, test, expect } from "bun:test";
import { findPerimeter } from "~/easy/find-perimeter";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = findPerimeter(strs);
        expect(result).toStrictEqual(output);
    });
});
