import { describe, test, expect } from "bun:test";
import { differenceOfSums } from "@/src/easy/difference-of-sums";
describe("differenceOfSums", () => {
    test.each([
        [10, 3, 19],
        [5, 6, 15],
        [5, 1, -15],
    ])(
        "\n\tGiven: an inclusive range of integers [%i, %i].\n\tThen: the difference divisible and non-divisible numbers are %i",
        (n: number, m: number, output: number) => {
            const result = differenceOfSums(n, m);
            expect(result).toStrictEqual(output);
        },
    );
});
