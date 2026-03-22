import { describe, expect, test } from "bun:test";
//biome-ignore format: manual alignment for readability
import { reverseWordPrefix } from "@/src/easy/reverse-word-prefix";
describe("reverseWordPrefix", () => {
	test.each([
		["abcdefd", "d", "dcbaefd"],
		["xyxzxe", "z", "zxyxxe"],
		["abcd", "z", "abcd"],
		["abcde", "a", "abcde"],
		["aabcd", "a", "aabcd"],
		["abcde", "e", "edcba"],
		["a", "a", "a"],
		["a", "b", "a"],
		["aabcaad", "a", "aabcaad"],
		["abacaba", "c", "cabaaba"],
		["abcdabcd", "d", "dcbaabcd"],
		["dcba", "a", "abcd"],
		["ba", "a", "ab"],
		["aaaa", "a", "aaaa"],
		["aaaa", "b", "aaaa"],
		["abcde", "b", "bacde"],
		["abcde", "d", "dcbae"],
		["ab", "a", "ab"],
		["ab", "b", "ba"],
		["ab", "z", "ab"],
		["racecar", "e", "ecarcar"],
		["racecar", "r", "racecar"],
		["aabba", "b", "baaba"],
		["mnopqrstu", "u", "utsrqponm"],
		["абагд", "а", "абагд"],
		["а", "а", "а"],
		["а", "б", "а"],
		["аб", "а", "аб"],
		["аааа", "а", "аааа"],
		["аааа", "б", "аааа"],
		["abcde", "а", "abcde"],
	])("\n\tGiven: the word %s and a reverse point of %s.\n\tThen: the result is %s.", (word: string, char: string, expected: string) => {
		const result = reverseWordPrefix(word, char);
		expect(result).toStrictEqual(expected);
	});
});
