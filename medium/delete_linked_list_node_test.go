package medium

import (
	"reflect"
	"testing"

	easy "github.com/wearypossum4770/dark-coding-challenges/easy"
)

func TestDeleteLinkedListNode(t *testing.T) {
	cases := []struct {
		nums     []int
		target   int
		expected []int
	}{
		{[]int{4, 5, 1, 9}, 5, []int{4, 1, 9}},
		{[]int{4, 5, 1, 9}, 1, []int{4, 5, 9}},
		{[]int{1, 2, 3, 4}, 3, []int{1, 2, 4}},
		{[]int{0, 1}, 0, []int{1}},
	}
	for _, c := range cases {
		head := easy.ListNodeFromArray(c.nums)
		node := head
		for node.Val != c.target {
			node = node.Next
		}
		t.Run("", func(t *testing.T) {
			DeleteLinkedListNode(node)
			result := easy.ArrayFromListNode(head)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("DeleteLinkedListNode(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
