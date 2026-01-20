import { describe, test, expect } from "bun:test";
import { preOrderTraversal } from "@/src/easy/pre-order-traversal";
import { TreeNode } from "@/src/helpers/data-structures";
const preOrderTestCases = [
	[
		[1, 2, 3, 4, 5, 6, 7],
		[1, 2, 4, 5, 3, 6, 7],
	],
	[
		[1, null, 2, 3],
		[1, 2, 3],
	],
	[[1], [1]],
	[[], []],
	[[0], [0]],
	[
		[-1, null, -2, null, -3],
		[-1, -2, -3],
	],
	[
		[10, 5, 15, 3, 7, null, 20],
		[10, 5, 3, 7, 15, 20],
	],
	[
		[1, 2, null, 3, null, 4, null, 5],
		[1, 2, 3, 4, 5],
	],
	[
		[1, null, 2, null, 3, null, 4, null, 5],
		[1, 2, 3, 4, 5],
	],
	[
		[100, 50, 150, 25, 75, 125, 175],
		[100, 50, 25, 75, 150, 125, 175],
	],
	[
		[0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0],
	],
	[
		[1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1],
	],
	[
		[-50, null, 50, null, null, -25, 75],
		[-50, 50, -25, 75],
	],
	[[null], []],
	[
		[-2147483648, null, 2147483647],
		[-2147483648, 2147483647],
	],
	[
		[1, 2, 3, 4, null, 5, 6, null, null, null, null, 7],
		[1, 2, 4, 3, 5, 7, 6],
	],
	[
		[1, 2, null, 3, 4, null, null, 5, 6],
		[1, 2, 3, 4, 5, 6],
	],
	[
		[10, 5, null, 3, null, 7, null, 1],
		[10, 5, 3, 7, 1],
	],
];
preOrderTestCases.push([
	[5, 4, 6, 3, 4.5, null, null],
	[5, 4, 3, 4.5, 6],
]);
// Very deep left-skewed tree (can cause stack overflow in recursive solutions)
const deepLeft = Array(1000).fill(null);
deepLeft[0] = 1;
for (let i = 1; i < 1000; i++) {
	deepLeft[i * 2] = i + 1;
}
preOrderTestCases.push([
	deepLeft,
	Array.from({ length: 1000 }, (_, i) => i + 1),
]);

// Very deep right-skewed tree
const deepRight = Array(1000).fill(null);
deepRight[0] = 1;
for (let i = 1; i < 1000; i++) {
	deepRight[i * 2 + 1] = i + 1;
}
preOrderTestCases.push([
	deepRight,
	Array.from({ length: 1000 }, (_, i) => i + 1),
]);

// All same values + complex structure
preOrderTestCases.push([
	[7, 7, 7, 7, 7, 7, 7, 7, 7, 7],
	[7, 7, 7, 7, 7, 7, 7, 7, 7, 7],
]);

// Single node with extreme value
preOrderTestCases.push([[-2147483648], [-2147483648]]);
preOrderTestCases.push([[2147483647], [2147483647]]);

// Only root with very large left & right subtrees (memory pressure)
preOrderTestCases.push([
	[0].concat(Array(5000).fill(1)).concat(Array(5000).fill(2)),
	[0].concat(Array(5000).fill(1)).concat(Array(5000).fill(2)),
]);
describe("preOrderTraversal", () => {
	test.each(
		preOrderTestCases,
	)("\n\tGiven: the tree %p.\n\tThen: it is %p in pre-order traversal", (inputs: number[], expected: number[]) => {
		const root = TreeNode.fromArray(inputs);
		const result = preOrderTraversal(root);
		expect(result).toStrictEqual(expected);
	});
});
