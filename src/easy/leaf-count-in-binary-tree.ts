import { TreeNode } from "../helpers/data-structures";

export const leafCountInBinaryTree = (root: TreeNode | null): number => {
	if (!root) return 0;
	if (root?.left === null && root?.right === null) return 1;
	return leafCountInBinaryTree(root?.left) + leafCountInBinaryTree(root?.right);
};
