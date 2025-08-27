import { describe, test, expect } from "bun:test";
import { findTheDifference } from "@/src/easy/find-the-difference";
describe("findTheDifference", () => {
    test.each([
        ["abcd", "abcde", "e"],
        ["", "y", "y"],
        ["a", "aa", "a"],
        ["aabbcc", "aabbccd", "d"],
    ])(
        "The string %s and %s have a difference of %s",
        (s: string, t: string, output: string) => {
            const result = findTheDifference(s, t);
            expect(result).toStrictEqual(output);
        },
    );
});
