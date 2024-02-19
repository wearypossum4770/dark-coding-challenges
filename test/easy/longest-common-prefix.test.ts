import { describe, test, expect } from "bun:test";
import { longestCommonPrefix } from "~/easy/longest-common-prefix";

describe('Find longest common "prefix"', () => {
    test.each([
        [["flower", "flow", "flight"], "fl"],
        [["dog", "racecar", "car"], ""],
        [["", "b"], ""],
        [["a"], "a"],
        [['flower', 'flower', 'flower', 'flower'], 'flower']
    ])(
        "Given the array of %o the longest common continuous string is %s",
        async (strs, output) => {
            const result = longestCommonPrefix(strs);
            expect(result).toStrictEqual(output);
        },
    );
});
