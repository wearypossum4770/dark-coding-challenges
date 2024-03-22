import { describe, test, expect } from "bun:test";
import { simpleArraySum } from "~/easy/simple-array-sum";
describe("Summ array elements", () => {
    test.each([[[1, 2, 3, 4, 10, 11], 31]])(
        "summing all elements in %o equals %d",
        (sample, output) => {
            const result = simpleArraySum(sample);
            expect(result).toStrictEqual(output);
        },
    );
});
