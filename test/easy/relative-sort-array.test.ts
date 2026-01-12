import { describe, test, expect } from "bun:test";
import { relativeSortArray } from "@/src/easy/relative-sort-array";
describe("\n\tFeature: Relative Sort Array", () => {
	test.each([
		[
			[2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19],
			[2, 1, 4, 3, 9, 6],
			[2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19],
		],
		[
			[28, 6, 22, 8, 44, 17],
			[22, 28, 8, 6],
			[22, 28, 8, 6, 17, 44],
		],
		[[5, 3, 8, 1, 9, 2], [], [1, 2, 3, 5, 8, 9]],
		[
			[5, 5, 2, 2, 8, 8],
			[2, 5, 8],
			[2, 2, 5, 5, 8, 8],
		],
		[[42], [42], [42]],
		[
			[100, 1, 100, 2],
			[1, 2],
			[1, 2, 100, 100],
		],
		[[3, 3, 3, 3, 3], [3], [3, 3, 3, 3, 3]],
		[[0], [0], [0]],
		[[], [1, 2, 3], []],
		[
			[7, 1, 7, 1, 7],
			[7, 1],
			[7, 7, 7, 1, 1],
		],
		[
			[999, 0, 500, 1000, 0],
			[0, 1000],
			[0, 0, 1000, 500, 999],
		],
		[
			[1, 2, 3, 4, 5],
			[5, 4, 3, 2, 1],
			[5, 4, 3, 2, 1],
		],
	])("\n\tGiven: the array %p and the sort order %p.\n\tThen: first array will be %p.", (arr1: number[], arr2: number[], expected: number[]) => {
		const result = relativeSortArray(arr1, arr2);
		expect(result).toStrictEqual(expected);
	});
});
