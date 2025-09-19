import { describe, test, expect } from "bun:test";
import { canConstructRansomNote } from "@/src/easy/can-construct-ransom-note";
describe("\n\tFeature: Can Ransom Note Be Constructed", () => {
    test.each([
        ["a", "b", false],
        ["aa", "aab", true],
        ["a", "a", true],
        ["aa", "ab", false],
        ["abc", "cbad", true],
        ["", "anything", true],
        ["a", "", false],
        ["", "", true],
        ["aA", "aa", true],
        ["Aa", "aA", true],
        ["zzz", "zzzzzz", true],
        ["zzzz", "zzz", false],
        ["hello world", "dlrow olleh", true],
    ])(
        "\n\tGiven: two strings '%s' and '%s'.\n\tThen: the first can be constructed from the first %p",
        (note: string, magazine: string, output: boolean) => {
            const result = canConstructRansomNote(note, magazine);
            expect(result).toStrictEqual(output);
        },
    );
});
