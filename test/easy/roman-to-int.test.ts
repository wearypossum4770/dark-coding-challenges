import { describe, test, expect } from "bun:test";
import { romanToInt } from "@/src/easy/roman-to-int";
describe("romanToInt", () => {
    test.each([
        ["IV", 4],
        ["XC", 90],
        ["CM", 900],
        ["MMM", 3_000],
        ["III", 3],
        ["XXVII", 27],
        ["LVIII", 58],
        ["MCMXCIV", 1_994],
        ["MMMCMXCIV", 3_994],
        ["I", 1],
        ["VIII", 8],
        ["XXIX", 29],
        ["LIV", 54],
        ["CCV", 205],
        ["CDXLIV", 444],
        ["CMXCIX", 999],
        ["M", 1_000],
        ["MMMDCCCLXXXVIII", 3_888],
        ["MMMCMX", 3_910],
    ])("", (inputs, output) => {
        const result = romanToInt(inputs);
        expect(result).toStrictEqual(output);
    });
});
