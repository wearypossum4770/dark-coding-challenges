import { describe, test, expect } from "bun:test";
import { topFrequentWords } from "@/src/medium/top-frequent-words";
describe("topFrequentWords", () => {
    test.each([
        [["i", "love", "leetcode", "i", "love", "coding"], 2, ["i", "love"]],
        [
            [
                "the",
                "day",
                "is",
                "sunny",
                "the",
                "the",
                "the",
                "sunny",
                "is",
                "is",
            ],
            4,
            ["the", "is", "sunny", "day"],
        ],
        [
            ["i", "love", "leetcode", "i", "love", "coding"],
            3,
            ["i", "love", "coding"],
        ],
        [["hello", "hello", "hello"], 1, ["hello"]],
        [["a", "b", "c", "d"], 4, ["a", "b", "c", "d"]],
        [
            ["apple", "banana", "apple", "banana", "cherry", "cherry"],
            3,
            ["apple", "banana", "cherry"],
        ],
        [["x", "y", "z"], 1, ["x"]],
        [[], 0, []],
        [
            ["a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b"],
            3,
            ["aaa", "b", "a"],
        ],
        [["one", "two"], 5, ["one", "two"]],
    ])("", (words: string[], k: number, output: string[]) => {
        const result = topFrequentWords(words, k);
        expect(result).toStrictEqual(output);
    });
});
