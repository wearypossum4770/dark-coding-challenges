package easy

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges/data_structures"
)

func Pop[T any](s *[]T) T {
	last := (*s)[len(*s)-1]
	*s = (*s)[:len(*s)-1]
	return last
}

func PreOrderTraversal[T any](root *core.TreeNode[T]) []T {
	if root == nil {
		return []T{}
	}
	result := []T{}
	stack := []*core.TreeNode[T]{root}
	for len(stack) > 0 {
		current := stack[len(stack)-1]
		stack = stack[:len(stack)-1]
		result = append(result, current.Val)

		if current.Right != nil {
			stack = append(stack, current.Right)
		}
		if current.Left != nil {
			stack = append(stack, current.Left)
		}
	}
	return result
}
