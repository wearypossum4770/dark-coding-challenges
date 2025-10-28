import { describe, test, expect } from "bun:test";
import { findFirstPalindrome } from "@/src/easy/find-first-palindrome";
describe("findFirstPalindrome", () => {
    test.each([
        [["abc", "car", "ada", "racecar", "cool"], "ada"],
        [["notapalindrome", "racecar"], "racecar"],
        [["def", "ghi"], ""],
    ])(
        "\n\tGiven: a list of words %p.\n\tThen: the first palindrome is %s",
        (inputs: string[], output: string) => {
            const result = findFirstPalindrome(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
