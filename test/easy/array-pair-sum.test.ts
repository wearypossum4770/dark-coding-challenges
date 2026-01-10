import { describe, test, expect } from "bun:test";
import { arrayPairSum } from "@/src/easy/array-pair-sum";
describe("\n\tFeature: Array Pair sum", () => {
	test.each([
		[[1, 4, 3, 2], 4],
		[[6, 2, 6, 5, 1, 2], 9],
		[[1, 1], 1],
		[[0, 0], 0],
		[[-1, -1], -1],
		[[10_000, 10_000], 10_000],
		[[5, 5, 5, 5], 10],
		[[7, 7, 7, 7, 7, 7], 21],
		[[1, 2, 3, 4, 5, 6], 9],
		[[6, 5, 4, 3, 2, 1], 9],
		[[-5, -4, -3, -2], -8],
		[[-10, -1, 1, 10], -9],
		[[-10_000, 10_000, -9_999, 9_999], -1],
		[[1, 100, 2, 99, 3, 98], 100 + 3],
		[[0, 0, 0, 0, 0, 0], 0],
		[[-10_000, 10_000], -10_000],
	])("\n\tGiven: an array %p.\n\tThen: the maximum sum of pairs is %i", (inputs: number[], expected: number) => {
		const result = arrayPairSum(inputs);
		expect(result).toStrictEqual(expected);
	});
});
