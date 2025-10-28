import { describe, test, expect } from "bun:test";
import { reverseVowels } from "@/src/easy/reverse-vowels";
describe("reverseVowels", () => {
    test.each([
        ["IceCreAm", "AceCreIm"],
        ["leetcode", "leotcede"],
        ["a", "a"],
        ["b", "b"],
        ["AEIOU", "UOIEA"],
        ["aeiou", "uoiea"],
        ["bcdfgh", "bcdfgh"],
        ["aA", "Aa"],
        ["a.b,e", "e.b,a"],
        ["hello world", "hollo werld"],
        ["aEiOu", "uOiEa"],
        [".,?!", ".,?!"],
        ["aaaaaa", "aaaaaa"],
        ["aAaaAa", "aAaaAa"],
    ])(
        "\n\tGiven: the word %s.\n\tThen: it is %s after reversing vowels.",
        (inputs, output) => {
            const result = reverseVowels(inputs);
            expect(result).toStrictEqual(output);
        },
    );
});
