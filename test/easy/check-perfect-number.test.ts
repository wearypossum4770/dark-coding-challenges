import { describe, test, expect } from "bun:test";
import {
    checkPerfectNumber,
    classifyPerfectNumber,
} from "@/src/easy/check-perfect-number";

describe("checkPerfectNumber", () => {
    test.each([
        ["496 is a perfect number", "perfect", 496, ""],
        ["8128 is a perfect number", "perfect", 8128, ""],
        ["8589869056 is a perfect number", "perfect", 8589869056, ""],
        ["137438691328 is a perfect number", "perfect", 137438691328, ""],

        [
            "Smallest perfect number is classified correctly",
            "perfect",
            6,
            "none",
        ],
        [
            "Medium perfect number is classified correctly",
            "perfect",
            28,
            "none",
        ],
        [
            "Large perfect number is classified correctly",
            "perfect",
            33550336,
            "none",
        ],

        [
            "Smallest abundant number is classified correctly",
            "abundant",
            12,
            "none",
        ],
        [
            "Medium abundant number is classified correctly",
            "abundant",
            30,
            "none",
        ],
        [
            "Large abundant number is classified correctly",
            "abundant",
            33550335,
            "none",
        ],

        [
            "Smallest prime deficient number is classified correctly",
            "deficient",
            2,
            "none",
        ],
        [
            "Smallest non-prime deficient number is classified correctly",
            "deficient",
            4,
            "none",
        ],
        [
            "Medium deficient number is classified correctly",
            "deficient",
            32,
            "none",
        ],
        [
            "Large deficient number is classified correctly",
            "deficient",
            33550337,
            "none",
        ],

        // ["Zero is rejected (not a natural number)", 0, "Classification is only possible for natural numbers."],
        // ["Negative integer is rejected (not a natural number)", -1, "Classification is only possible for natural numbers."],
    ])(
        "\n\tGiven: %s",
        (criteria: string, expected: string, num: number, err: string) => {
            const value = classifyPerfectNumber(num);
            const result = checkPerfectNumber(num);
            expect(value).toStrictEqual(expected);
            expect(result).toBe(value === "perfect");
        },
    );
});
