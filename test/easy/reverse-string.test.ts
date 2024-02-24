import { describe, test, expect } from "bun:test";
import { reverseString } from "~/easy/reverse-string";
describe("Reverse String", () => {
    test.each([
        ["an empty string", "", ""],
        ["a word", "robot", "tobor"],
        ["a capitalized word", "Ramen", "nemaR"],
        ["a sentence with punctuation", "I'm hungry!", "!yrgnuh m'I"],
        ["a palindrome", "racecar", "racecar"],
    ])("%s", (_strs, word, output) => {
        const result = reverseString(word);
        expect(result).toStrictEqual(output);
    });
});
