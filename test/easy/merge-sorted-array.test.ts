import { describe, test, expect } from "bun:test";
import {
    mergeSortedArray,
    mergeSortedArrayInPlace,
} from "@/src/easy/merge-sorted-array";
describe("\n\tFeature: Merge two sorted arrays.", () => {
    test.each([
        [[1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]],
        [[1], 1, [], 0, [1]],
    ])(
        "\n\tGiven: an array %p with length %i.\n\tAnd: another array %p with length %i are merged (MUTATION)",
        (
            first: number[],
            firstSize: number,
            second: number[],
            secondSize: number,
            expected: number[],
        ) => {
            const result = mergeSortedArray(
                first,
                firstSize,
                second,
                secondSize,
            );
            expect(result).toStrictEqual(expected);
        },
    );
    test.each([
        [[1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]],
        [[1], 1, [], 0, [1]],
    ])(
        "\n\tGiven: an array %p with length: %i.\n\tAnd: another array %p with length %i are merged. (IN-PLACE)",
        (
            nums1: number[],
            m: number,
            nums2: number[],
            n: number,
            expected: number[],
        ) => {
            mergeSortedArrayInPlace(nums1, m, nums2, n);
            expect(nums1).toStrictEqual(expected);
        },
    );
});
