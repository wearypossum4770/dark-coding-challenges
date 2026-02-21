package easy

func LeafCountInBinaryTree(root *TreeNode) int {
	if root == nil {
		return 0
	}
	if root.Left == nil && root.Right == nil {
		return 1
	}
	return LeafCountInBinaryTree(root.Left) + LeafCountInBinaryTree(root.Right)
}
