import type { TreeNode } from "../helpers/data-structures";

export const preOrderTraversal = (root: TreeNode | null): number[] => {
	if (!root) return [];
	const result: number[] = [];
	const stack: TreeNode[] = [root];
	while (stack.length > 0) {
		const node = stack.pop();
		if (node) {
			result.push(node.val);
			if (node.right) stack.push(node.right);
			if (node.left) stack.push(node.left);
		}
	}
	return result;
};
