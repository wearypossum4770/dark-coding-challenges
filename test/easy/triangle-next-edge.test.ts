import { describe, test, expect } from "bun:test";
import { triangleNextEdge } from "~/easy/triangle-next-edge";
describe("Maximum Edge of a Triangle", () => {
    test.each([
        [5, 4, 8],
        [8, 3, 10],
        [7, 9, 15],
        [10, 4, 13],
        [7, 2, 8],
    ])(
        "given two sides of a triangle %d & %d the maximum size of the last edge is %d",
        (a, b, output) => {
            const result = triangleNextEdge(a, b);
            expect(result).toStrictEqual(output);
        },
    );
});
