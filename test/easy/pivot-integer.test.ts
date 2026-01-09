import { describe, test, expect } from "bun:test";
import { pivotInteger } from "@/src/easy/pivot-integer";
describe("pivotInteger", () => {
	test.each([
		[1, 1],
		[8, 6],
		[4, -1],
		[2, -1],
		[3, -1],
		[5, -1],
		[9, -1],
		[10, -1],
		[49, 35],
		[100, -1],
		[288, 204],
		[500, -1],
		[1_000, -1],
		[0, -1],
		[999, -1],
	])("\n\tGiven: the integer %i.\n\tThen: the pivot number is %i.", (inputs: number, expected: number) => {
		const result = pivotInteger(inputs);
		expect(result).toStrictEqual(expected);
	});
});
