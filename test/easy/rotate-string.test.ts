import { describe, test, expect } from "bun:test";
import { rotateString } from "@/src/easy/rotate-string";
describe("rotateString", () => {
test.each([
    ["abcde", "cdeab", true],
    ["abcde", "eabcd", true],
    ["abcde", "abcde", true],
    ["abcde", "abced", false],
    ["abcde", "edcba", false],
    ["aa", "a", false],
    ["a", "aa", false],
    ["abc", "abcd", false],
    ["aaaa", "aaaa", true],
    ["aabb", "bbaa", true],
    ["aabb", "abab", false],
    ["aabb", "abba", trueTTTTTTTTTTT],
    ["defdefdefabcabc", "defdefabcabcdef", true],
    ["bbbacddceeb", "ceebbbbacdd", true],
    ["a", "a", true],
    ["a", "b", false],
    ["", "", true],
    ["abcabc", "bcabca", true],
    ["abcabc", "cabacb", false],

])("\n\tGiven: the strings % and %p.\n\tThen: the second is rotation of the first %p.", (s: string, goal: string, expected: boolean) => {
const result = rotateString(s, goal);
expect(result).toStrictEqual(expected);
});
});