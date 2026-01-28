package easy

type Pair struct {
	Node   *TreeNode
	IsLeft bool
}

func SumOfLeftLeaves(root *TreeNode) int {
	count := 0
	if root == nil {
		return count
	}
	stack := []Pair{{root, false}}
	for len(stack) > 0 {
		pair := stack[len(stack)-1]
		stack = stack[:len(stack)-1]
		if pair.Node.Left == nil && pair.Node.Right == nil && pair.IsLeft {
			count += pair.Node.Val
		}
		if pair.Node.Left != nil {
			stack = append(stack, Pair{pair.Node.Left, true})
		}
		if pair.Node.Right != nil {
			stack = append(stack, Pair{pair.Node.Right, false})
		}
	}
	return count
}
