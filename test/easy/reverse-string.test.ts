import { describe, test, expect } from "bun:test";
import { reverseString } from "@/src/easy/reverse-string";
describe("Feature: Reverse a string", () => {
    test.each([
        [
            ["h", "e", "l", "l", "o"],
            ["o", "l", "l", "e", "h"],
        ],
        [
            ["a", "b", "c", "d"],
            ["d", "c", "b", "a"],
        ],
        [["z"], ["z"]],
        [[], []],
    ])(
        "\n\t\tGiven the array %p\n\t\tThen reversed in-place it is %p",
        (inputs: string[], output: string[]) => {
            const result = reverseString(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
