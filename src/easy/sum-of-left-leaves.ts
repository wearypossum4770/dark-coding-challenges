import type { TreeNode } from "../helpers/data-structures";

type Pair = [TreeNode | null, boolean];
export const sumOfLeftLeaves = (root: TreeNode | null): number => {
	const stack: Pair[] = [[root, false]];
	let count = 0;
	if (root === null) return count;
	while (stack.length > 0) {
		const [current, isLeft] = stack.pop() ?? [];
		if (current?.left === null && current?.right === null && isLeft) {
			count += current?.val ?? 0;
		}

		if (current?.left !== null) stack.push([current.left, true]);
		if (current?.right !== null) stack.push([current.right, false]);
	}
	return count;
};
