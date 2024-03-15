import { describe, test, expect } from "bun:test";
import { howManyWalls } from "~/easy/how-many-walls";
describe("Painting walls", () => {
    test.each([
        [100, 4, 5, 5],
        [10, 15, 12, 0],
        [41, 3, 6, 2],
        [50, 11, 5, 0],
        [1, 1, 1, 1],
    ])(
        "With %dm² each wall is %dm wide and %dm high can paint %d walls",
        (walls: number, width: number, height: number, output: number) => {
            const result = howManyWalls(walls, width, height);
            expect(result).toStrictEqual(output);
        },
    );
});
