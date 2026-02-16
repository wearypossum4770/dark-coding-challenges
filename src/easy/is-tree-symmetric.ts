import { TreeNode } from "../helpers/data-structures";

export const isTreeSymmetric = (root: TreeNode | null): boolean => {
	// if it doesn't have a root node should return false because it falls outside constraints, technically is it symmetrical?
	if (root === null) return true;
	const checkMirror = (lhs: TreeNode | null, rhs: TreeNode | null): boolean => {
		if (lhs === null && rhs === null) return true;
		if (lhs === null || rhs === null) return false;

		return (
			lhs.val === rhs.val &&
			checkMirror(lhs.left, rhs.right) &&
			checkMirror(lhs.right, rhs.left)
		);
	};
	return checkMirror(root.left, root.right);
};
