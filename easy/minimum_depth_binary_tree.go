package easy

func MinimumDepthBinaryTree(root *TreeNode) int {
	if root == nil {
		return 0
	}
	left, right := root.Left, root.Right
	if left == nil && right == nil {
		return 1
	}
	if left == nil {
		return 1 + MinimumDepthBinaryTree(right)
	}
	if right == nil {
		return 1 + MinimumDepthBinaryTree(left)
	}
	return 1 + min(MinimumDepthBinaryTree(left), MinimumDepthBinaryTree(right))
}
