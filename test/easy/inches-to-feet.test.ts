import { describe, test, expect } from "bun:test";
import { inchesToFeet } from "~/easy/inches-to-feet";
describe("Inches to feet", () => {
    test.each([
        [12, 1],
        [360, 30],
        [3612, 301],
        [324, 27],
        [3012, 251],
        [11, 0],
    ])("%d inches is %d feet", (inches, output) => {
        const result = inchesToFeet(inches);
        expect(result).toStrictEqual(output);
    });
});
