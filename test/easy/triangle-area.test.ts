import { describe, test, expect } from "bun:test";
import { triangleArea } from "~/easy/triangle-area";
describe("Triangle Area", () => {
    test.each([
        [3, 2, 3],
        [5, 4, 10],
        [10, 10, 50],
        [0, 60, 0],
        [12, 11, 66],
    ])(
        "A triangle with a base %d and height %d is %d",
        (base, height, output) => {
            const result = triangleArea(base, height);
            expect(result).toStrictEqual(output);
        },
    );
});
