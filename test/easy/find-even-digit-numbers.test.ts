import { describe, test, expect } from "bun:test";
import { findEvenDigitNumbers } from "@/src/easy/find-even-digit-numbers";
describe("findEvenDigitNumbers", () => {
    test.each([
        [[12, 345, 2, 6, 7896], 2],
        [[555, 901, 482, 1771], 1],
    ])(
        "\n\tGiven: An array %p.\n\tThen: it has %i even digit numbers",
        (inputs: number[], output: number) => {
            const result = findEvenDigitNumbers(inputs);
            expect(result).toBe(output);
        },
    );
});
