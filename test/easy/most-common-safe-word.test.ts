import { describe, test, expect } from "bun:test";
import { mostCommonSafeWord } from "@/src/easy/most-common-safe-word";
describe("mostCommonSafeWord", () => {
    test.each([
        [
            "Bob hit a ball, the hit BALL flew far after it was hit.",
            ["hit"],
            "ball",
        ],
        ["a.", [], "a"],
        ["a b.b", [], "b"],
        ["Bob. hIt, baLl", ["bob", "hit"], "ball"],
        ["Apple apple pear APPLE!", ["apple"], "pear"],
        ["Wow! wow? wow. really, really... REALLY!", ["wow"], "really"],
        ["test test test test", [], "test"],
        ["apple banana apple banana cherry", ["banana"], "apple"],
    ])(
        "\n\tGiven: a paragraph %s.\n\tAnd: a list of banned words: %p.\n\tThen: the most common word is %s",
        (paragraphs: string, banned: string[], output: string) => {
            const result = mostCommonSafeWord(paragraphs, banned);
            expect(result).toBe(output);
        },
    );
});
