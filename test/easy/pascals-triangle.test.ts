import { describe, test, expect } from "bun:test";
import { pascalsTriangle } from "~/easy/pascals-triangle";
describe("Pascal's Triangle", () => {
    test.each([
        [0, []],
        [1, [[1]]],
        [5, [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]],
    ])("given %d rows the triangle is represented by %o", (rows, output) => {
        const result = pascalsTriangle(rows);
        expect(result).toStrictEqual(output);
    });
});
