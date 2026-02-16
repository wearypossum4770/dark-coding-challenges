package easy

func checkMirror(left, right *TreeNode) bool {
	if left == nil && right == nil {
		return true
	}
	if left == nil || right == nil {
		return false
	}
	return left.Val == right.Val && checkMirror(left.Left, right.Right) && checkMirror(left.Right, right.Left)
}
func IsTreeSymmetric(root *TreeNode) bool {
	if root == nil {
		return true
	}
	return checkMirror(root.Left, root.Right)
}
