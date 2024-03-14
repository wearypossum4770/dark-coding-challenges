import { describe, test, expect } from "bun:test";
import { shouldServeDrinks } from "~/easy/should-serve-drinks";
describe("Can serve drinks", () => {
    test.each([
        [17, true, false],
        [30, true, false],
        [24, false, true],
        [18, false, true],
        [3, false, false],
    ])(
        "customer's age %d bartender not on break %o",
        (age, onBreak, output) => {
            const result = shouldServeDrinks(age, onBreak);
            expect(result).toStrictEqual(output);
        },
    );
});
