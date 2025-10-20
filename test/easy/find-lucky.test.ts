import { describe, test, expect } from "bun:test";
import { findLucky } from "@/src/easy/find-lucky";
describe("findLucky", () => {
    test.each([
        [[2, 2, 3, 4], 2],
        [[1, 2, 2, 3, 3, 3], 3],
        [[2, 2, 2, 3, 3], -1],
    ])("\n\tGiven: ", (inputs: number[], output: number) => {
        const result = findLucky(inputs);
        expect(result).toStrictEqual(output);
    });
});
