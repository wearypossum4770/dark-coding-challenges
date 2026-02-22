import type { TreeNode } from "../helpers/data-structures";

export const treePathHasSum = (
	root: TreeNode | null,
	targetSum: number,
): boolean => {
	// check if the tree exists.
	if (root === null) return true;
	if (root.left === null && root.right === null) return root.val === targetSum;
	return (
		treePathHasSum(root.left, targetSum - root.val) ||
		treePathHasSum(root.right, targetSum - root.val)
	);
};
