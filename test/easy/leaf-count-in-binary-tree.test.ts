import { describe, expect, test } from "bun:test";

import { leafCountInBinaryTree } from "@/src/easy/leaf-count-in-binary-tree";
import { TreeNode } from "~/src/helpers/data-structures";

describe("leafCountInBinaryTree", () => {
	test.each([
		[[1, 10, 39, 5], 2],
		[[4, 8, 10, 7, null, 5, 1, 3], 3],
		[[50, 30, 70, 20, 40, 60, 80, null, null, null, null, 65], 4],
		[[30, 25, 35, 20, 28, null, 40, null, null, 27], 3],
		[[1, 2, 3, -1, -1, -1, -1], 4],
		[[1, 2, 3, null, null, null, null], 2],
		[[1, 2, 3, 4, 5, null, null, null, null, null, null], 3],
		[[10, 20, 30, 40, 50, 60, 70], 4],
		[[null], 0],
		[[5], 1],
		[[1, null, null], 1],
		[[1, 2, null, 3, null, 4, null, 5, null], 1],
		[[1, null, 2, null, 3, null, 4, null, 5, null, 6], 1],
		[
			//biome-ignore format: manual alignment for readability
			[ 50, 30, 70, 20, 40, 60, 80, null, null, null, null, null, null, null, null,
			],
			4,
		],

		// Difficult / degenerate cases
		[
			//biome-ignore format: manual alignment for readability
			[ 1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10,
			],
			1,
		],
		[[-5, -8, -3, -12, -7, null, null, null, null, null, null], 3],
		[[100000, 99999, 1, 2, null, null, null, 3, 4, 5, 6], 4],
		[[-42, 42, -42, 42, -42, 42, -42], 4],
		[[7, null, 8, null, 9, null, 10, null, 11, null, 12, null, 13], 1],
		[
			//biome-ignore format: manual alignment for readability
			[ 1, 2, 3, null, null, null, 4, null, null, null, null, null, null, null, 5,
			],
			2,
		],
		[[99999, null, null], 1],
	])("\n\tGiven: the binary tree %p.\n\tThen: it has a total of %i leaves.", (nums: number[], expected: number) => {
		const root = TreeNode.fromArray(nums);
		const result = leafCountInBinaryTree(root);
		expect(result).toStrictEqual(expected);
	});
});
