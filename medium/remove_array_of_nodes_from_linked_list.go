package medium

import (
	easy "github.com/wearypossum4770/dark-coding-challenges/easy"
)

func RemoveArrayOfNodesFromLinkedList(nums []int, head *easy.ImprovedListNode[int]) *easy.ImprovedListNode[int] {
	set := make(map[int]bool, 1e5)
	for _, num := range nums {
		set[num] = true
	}
	dummy := &easy.ImprovedListNode[int]{Val: 0, Next: head}

	for current := dummy; current.Next != nil; {
		if set[current.Next.Val] {
			current.Next = current.Next.Next
		} else {
			current = current.Next
		}
	}
	return dummy.Next
}
