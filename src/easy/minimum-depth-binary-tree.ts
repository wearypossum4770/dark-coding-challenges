import type { TreeNode } from "../helpers/data-structures";

export const minimumDepthBinaryTree = (root: TreeNode | null): number => {
	if (root === null) return 0;
	const left = root.left;
	const right = root.right;
	if (left === null && right === null) return 1;
	if (left === null) return 1 + minimumDepthBinaryTree(right);
	if (right === null) return 1 + minimumDepthBinaryTree(left);
	return (
		1 + Math.min(minimumDepthBinaryTree(left), minimumDepthBinaryTree(right))
	);
};
