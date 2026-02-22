package easy

func TreePathHasSum(root *TreeNode, targetSum int) bool {
	if root == nil {
		return false
	}
	if root.Left == nil && root.Right == nil {
		return targetSum == root.Val
	}
	remainder := targetSum - root.Val
	return TreePathHasSum(root.Left, remainder) || TreePathHasSum(root.Right, remainder)
}
