import { describe, test, expect } from "bun:test";
import { radiansToDegrees } from "~/easy/radians-to-degrees";
describe("Radians to degrees", () => {
    test.each([
        [1, 57.29577951308232],
        [5, 286.4788975654116],
        [7, 401.07045659157626],
        [100, 5729.5779513082325],
        [180, 10313.240312354817],
    ])("a radian measure of %d measures %d degrees", (radians, output) => {
        const result = radiansToDegrees(radians);
        expect(result).toBeCloseTo(output);
    });
});
