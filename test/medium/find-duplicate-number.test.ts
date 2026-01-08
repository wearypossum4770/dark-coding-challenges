import { describe, test, expect } from "bun:test";
import { findDuplicateNumber } from "@/src/medium/find-duplicate-number";
describe("\n\tFeature: Find Duplicate Numbers", () => {
	test.each([
		[[1, 1], 1],
		[[1, 3, 4, 2, 2], 2],
		[[3, 1, 3, 4, 2], 3],
		[[3, 3, 3, 3, 3], 3],
		[[2, 1, 2], 2],
		[[1, 4, 6, 3, 2, 5, 6], 6],
		[[5, 4, 3, 2, 1, 5], 5],
		[[1, 2, 3, 4, 5, 6, 7, 8, 9, 9], 9],
		[[2, 2, 2, 2, 2], 2],
		[[1, 1, 2, 3, 4, 5], 1],
		[[4, 3, 1, 4, 2], 4],
		[[6, 1, 5, 4, 3, 2, 6], 6],
		[[1, 2, 3, 4, 5, 3], 3],
		[[7, 6, 5, 4, 3, 2, 1, 7], 7],
		[[1, 2, 3, 4, 5], 0],
	])("\n\tGiven: the array %p.\n\tThen: the duplicate value is %i", (inputs: number[], expected: number) => {
		const result = findDuplicateNumber(inputs);
		expect(result).toStrictEqual(expected);
	});
});
