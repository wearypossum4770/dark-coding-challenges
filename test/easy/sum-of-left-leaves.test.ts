import { describe, expect, test } from "bun:test";
//biome-ignore format: manual alignment for readability
import { sumOfLeftLeaves } from "@/src/easy/sum-of-left-leaves";
import { TreeNode } from "@/src/helpers/data-structures";
describe("sumOfLeftLeaves", () => {
	test.each([
		[[], 0],
		[[1], 0],
		[[1, 2], 2],
		[[1, null, 3], 0],
		[[1, 2, 3], 2],
		[[3, 9, 20, null, null, 15, 7], 24],
		[[1, 2, null, 3, null, 4], 4],
		[[1, null, 2, null, 3, null, 4], 0],
		[[1, 2, 3, 4, 5], 4],
		[[1, 2, 3, null, 4], 0],
		[[0, -1, -2], -1],
		[[1, 2, null, null, 3], 0],
		[[1, null, 2, 3], 3],
		[[1, 2, 3, 4, null, null, 5], 4],
	])("\n\tGiven: the tree structure %p.\n\tThen: the sum of left leaves is %i.", (inputs: number[], expected: number) => {
		const root = TreeNode.fromArray(inputs);
		const result = sumOfLeftLeaves(root);
		expect(result).toStrictEqual(expected);
	});
});
