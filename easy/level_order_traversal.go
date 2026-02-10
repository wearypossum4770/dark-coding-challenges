package easy

func LevelOrderTraversal(root *TreeNode) [][]int {
	result := [][]int{}
	if root == nil {
		return result
	}

	queue := []*TreeNode{root}

	for len(queue) > 0 {
		size := len(queue)
		current := make([]int, 0, size)
		for range size {
			node := queue[0]
			queue = queue[1:]
			current = append(current, node.Val)
			if node.Left != nil {
				queue = append(queue, node.Left)
			}
			if node.Right != nil {
				queue = append(queue, node.Right)
			}
		}
		result = append(result, current)
	}
	return result
}
