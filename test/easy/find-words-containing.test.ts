import { describe, test, expect } from "bun:test";
import { findWordsContaining } from "@/src/easy/find-words-containing";
describe("findWordsContaining", () => {
    test.each([
        [["abc", "bcd", "aaaa", "cbc"], "a", [0, 2]],
        [["leet", "code"], "e", [0, 1]],
        [["abc", "bcd", "aaaa", "cbc"], "z", []],
    ])("", (words: string[], char: string, output: number[]) => {
        const result = findWordsContaining(words, char);
        expect(result).toStrictEqual(output);
    });
});
