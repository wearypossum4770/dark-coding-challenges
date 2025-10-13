import { describe, test, expect } from "bun:test";
import { stringIntegerIsBalanced } from "@/src/easy/string-integer-is-balanced";
describe("stringIntegerIsBalanced", () => {
    test.each([
        ["12", false],

        ["11", true],

        ["1234", false],

        ["24123", true],

        ["00", true],

        ["10", false],

        ["1010", false],

        ["909", false],

        ["1234567890", false],

        ["111111", true],

        ["123321", true],

        ["99999999", true],

        ["5005", true],

        ["1234567", false],
        ["1", false],
    ])(
        "\n\tGiven: the string %s.\n\tThen: the sum of even and odd integers is equal. %p",
        (inputs: string, output: boolean) => {
            const result = stringIntegerIsBalanced(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
