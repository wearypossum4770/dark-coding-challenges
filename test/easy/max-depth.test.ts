import { describe, expect, test } from "bun:test";
import { maxDepth } from "@/src/easy/max-depth";
import { TreeNode } from "~/src/helpers/data-structures";
describe("maxDepth", () => {
	test.each([
		[[3, 9, 20, null, null, 15, 7], 3],
		[[1, null, 2], 2],
		[[1], 1],
		[[], 0],
		[[1, 2, null, 3, null, 4, null, 5], 5],
		[[1, null, 2, null, 3, null, 4, null, 5], 5],
		[[1, 2, 3, 4, 5, 6, 7], 3],
		[[1, 2, 3, 4, 5, 6, null], 3],
		[[5, 4, 6, 3, null, null, 7, null, 2], 4],
		[[-100, -100, -100, -100, -100], 3],
		[[0], 1],
		[[100], 1],
		[[10, 20, null, 30, null, 40, null, 50], 5],
	])("\n\tGiven: the tree structure %p.\n\tThen: it's maximum depth is %i.", (inputs: number[], expected: number) => {
		const root = TreeNode.fromArray(inputs);
		const result = maxDepth(root);
		expect(result).toStrictEqual(expected);
	});
});
