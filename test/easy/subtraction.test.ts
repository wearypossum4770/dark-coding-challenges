import { describe, test, expect } from "bun:test";
import { subtraction } from "~/easy/subtraction";
describe("Testing Setup (subtraction)", () => {
    test.each([[945, 422, 523]])(
        "The difference between %i and %i is %i",
        (minuend, subtrahend, difference) => {
            const result = subtraction(minuend, subtrahend);
            expect(result).toStrictEqual(difference);
        },
    );
});
