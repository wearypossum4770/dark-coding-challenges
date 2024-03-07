import { describe, test, expect } from "bun:test";
import { basketballPoints } from "~/easy/basketball-points";
describe("Calculate Baseketball Score", () => {
    test.each([
        [1, 1, 5],
        [1, 2, 8],
        [2, 1, 7],
        [2, 2, 10],
        [69, 420, 1398],
    ])(
        "The sum of %d 2-point shots and %d 3-point shots is %d",
        async (twoPoints, threePoints, output) => {
             const result = basketballPoints(twoPoints, threePoints);
            expect(result).toStrictEqual(output);
        },
    );
});
