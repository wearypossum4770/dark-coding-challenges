import { describe, test, expect } from "bun:test";
import { yearsInOneHouse } from "~/easy/years-in-one-house";
describe("Moving house", () => {
    test.each([
        [30, 1, 15],
        [15, 2, 5],
        [80, 0, 80],
        [23, 2, 8],
        [31, 2, 10],
        [1, 0, 1],
    ])("person aged %d moved an average of %d times.", (age, moves, output) => {
        const result = yearsInOneHouse(age, moves);
        expect(result).toStrictEqual(output);
    });
});
