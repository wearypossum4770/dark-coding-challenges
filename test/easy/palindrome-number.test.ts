import { describe, test, expect } from "bun:test";
import { palindromeNumber } from "@/src/easy/palindrome-number";
describe("Feature: Determine if a number is palindromic", () => {
    describe("\n\tScenario: Check if a negative number is a palindrome", () => {
        test.each([
            [-121, false],
            [-101, false],
            [-10, false],
            [-1, false],
            [-101, false],
        ])(
            "\n\t\tGiven the number is %i\n\t\tWhen I check if the number is a palindrome\n\t\tThen the result should be %p",
            (candidate: number, output: boolean) => {
                const result = palindromeNumber(candidate);
                expect(result).toBe(output);
            },
        );
    });
    describe("\n\tScenario: Check if a non-palindromic number is correctly identified", () => {
        test.each([
            [10, false],
            [100, false],
            [123, false],
            [1000030001, false],
        ])(
            "\n\t\tGiven the number is %i\n\t\tWhen I check if the number is a palindrome\n\t\tThen the result should be %p",
            (candidate: number, output: boolean) => {
                const result = palindromeNumber(candidate);
                expect(result).toBe(output);
            },
        );
    });
    describe("\n\tScenario: Check if a positive number is a palindrome", () => {
        test.each([
            [121, true],
            [0, true],
            [3, true],
            [8, true],
            [9, true],
            [11, true],
            [1, true],
            [313, true],
        ])(
            "\n\t\tGiven the number is %i\n\t\tWhen I check if the number is a palindrome\n\t\tThen the result should be",
            (candidate: number, output: boolean) => {
                const result = palindromeNumber(candidate);
                expect(result).toBe(output);
            },
        );
    });
});
