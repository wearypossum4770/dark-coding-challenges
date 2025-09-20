import { describe, test, expect } from "bun:test";
import { stringIsSubsequence } from "@/src/easy/string-is-subsequence";
describe("stringIsSubsequence", () => {
    test.each([
        ["abc", "ahbgdc", true],
        ["", "", true],
        ["", "anything", true],
        ["a", "a", true],
        ["a", "b", false],
        ["z", "abc", false],
        ["acb", "abc", false],
        ["xyz", "abcxyz", true],
        ["aaa", "aaaaaa", true],
        ["aaa", "aa", false],
        ["abc", "abc", true],
        ["abc", "a" + "x".repeat(9999) + "b" + "y".repeat(9999) + "c", true],
        ["ace", "abcde", true],
        ["aec", "abcde", false],
        ["axc", "ahbgdc", false],
    ])(
        "\n\tGiven: the string %s is a subsequence of %s.\n\tThen: it will be %p",
        (s: string, t: string, output: boolean) => {
            const result = stringIsSubsequence(s, t);
            expect(result).toStrictEqual(output);
        },
    );
});
