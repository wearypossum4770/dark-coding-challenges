import { describe, test, expect } from "bun:test";
import { rectangleArea } from "~/easy/geometry";
describe("Geometry", () => {
    test.each([
        [5, 3, 15],
        [8, 5, 40],
        [5, 4, 20],
        [2, 3, 6],
        [10_000, 10_000, 100_000_000],
        [-2, -5, -1],
        [0, 3, -1],
        [5, -3, -1],
        [0, 1, -1],
        [-1, 0, -1],
    ])(
        "a rectangle length: %d and width: %d has area of %d",
        (length, width, output) => {
            const result = rectangleArea(length, width);
            expect(result).toStrictEqual(output);
        },
    );
});
