import { describe, test, expect } from "bun:test";
import { profitableGamble } from "~/easy/profitable-gamble";
describe("Profitable Gamble", () => {
    test.each([
        [0.2, 50, 9, true],
        [0.9, 1, 2, false],
        [0.9, 3, 2, true],
        [0.33, 10, 3.3, true],
        [0, 1000, 0.01, false],
        [0.1, 1000, 7, true],
        [0, 0, 0, false],
    ])(
        "a probability of %d and a prize of %d costs %d and makes a profit %o",
        (probability, prize, cost, output) => {
            const result = profitableGamble(probability, prize, cost);
            expect(result).toStrictEqual(output);
        },
    );
});
