import { describe, test, expect } from "bun:test";
import { shapeArea } from "~/easy/shape-area";
describe("", () => {
    test.each([])("", (strs, output) => {
        const result = shapeArea(strs);
        expect(result).toStrictEqual(output);
    });
});
