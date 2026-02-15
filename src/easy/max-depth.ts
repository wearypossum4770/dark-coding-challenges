import type { TreeNode } from "../helpers/data-structures";

export const maxDepth = (root: TreeNode | null): number => {
	if (root == null) return 0;
	const left = maxDepth(root?.left);
	const right = maxDepth(root?.right);
	return Math.max(left, right) + 1;
};
