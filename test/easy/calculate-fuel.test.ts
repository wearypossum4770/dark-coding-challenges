import { describe, test, expect } from "bun:test";
import { calculateFuel } from "~/easy/calculate-fuel";
describe("Calculate fuel", () => {
    test.each([
        [15, 150],
        [23, 230],
        [10, 100],
        [3, 100],
        [23.5, 235],
        [3.14, 100],
        [9.99999, 100],
        [822315322, 8223153220],
        [12345.6789, 123456.789],
        [31.41, 314.1],

        // Author: Joshua Señoron
    ])(
        "with a distance of %d should have %d gallons of fuel",
        (distance, output) => {
            const result = calculateFuel(distance);
            expect(result).toStrictEqual(output);
        },
    );
});
