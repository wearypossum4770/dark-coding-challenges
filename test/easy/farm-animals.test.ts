import { describe, test, expect } from "bun:test";
import { farmAnimals } from "~/easy/farm-animals";
describe("The farm problem", () => {
    test.each([
        [5, 2, 8, 50],
        [3, 4, 7, 50],
        [1, 2, 3, 22],
        [3, 5, 2, 34],
    ])("counting legs on the far", (chickens, cows, pigs, output) => {
        const result = farmAnimals(chickens, cows, pigs);
        expect(result).toStrictEqual(output);
    });
});
