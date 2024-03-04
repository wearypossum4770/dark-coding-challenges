import { describe, test, expect } from "bun:test";
import { findPangram, hackerRankPangram } from "~/easy/find-pangram";
describe("Test for Pangram.", () => {
    test.each([
        ["We promptly judged antique ivory buckles for the next prize", true],
        ["We promptly judged antique ivory buckles for the prize", false],
    ])("Hacker rank pangram", (sentence, output) => {
        const target = output ? "pangram" : "not pangram";
        const result = hackerRankPangram(sentence);
        expect(result).toStrictEqual(target);
    });
    test.each([
        ["empty sentence", "", false],
        ["perfect lower case", "abcdefghijklmnopqrstuvwxyz", true],
        [
            "only lower case",
            "the quick brown fox jumps over the lazy dog",
            true,
        ],
        [
            "missing the letter 'x'",
            "a quick movement of the enemy will jeopardize five gunboats",
            false,
        ],
        [
            "missing the letter 'h'",
            "five boxing wizards jump quickly at it",
            false,
        ],
        [
            "with underscores",
            "the_quick_brown_fox_jumps_over_the_lazy_dog",
            true,
        ],
        [
            "with numbers",
            "the 1 quick brown fox jumps over the 2 lazy dogs",
            true,
        ],
        [
            "missing letters replaced by numbers",
            "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog",
            false,
        ],
        [
            "mixed case and punctuation",
            '"Five quacking Zephyrs jolt my wax bed."',
            true,
        ],
        [
            "a-m and A-M are 26 different characters but not a pangram",
            "abcdefghijklm ABCDEFGHIJKLM",
            false,
        ],
    ])(
        "when %s is given the values %s is a pangram %o",
        (_rule: string, sentence: string, output: boolean) => {
            const result = findPangram(sentence);
            expect(result).toStrictEqual(output);
        },
    );
});
