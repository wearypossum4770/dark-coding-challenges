package easy

import (
	//	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"

	"math"
	"reflect"
	"testing"
)

func TestMiddleLinkedListNode(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{}, []int{}},
		{[]int{math.MaxInt64}, []int{math.MaxInt64}},
		{[]int{math.MaxInt64, math.MaxInt64}, []int{math.MaxInt64}},
		{[]int{1, 1, 1, 1, 1}, []int{1, 1, 1}},
		{[]int{-3, -2, -1, 0, 1, 2, 3}, []int{0, 1, 2, 3}},
		{[]int{1}, []int{1}},
		{[]int{1, 2}, []int{2}},
		{[]int{1, 2, 3}, []int{2, 3}},
		{[]int{1, 2, 3, 4}, []int{3, 4}},
		{[]int{1, 2, 3, 4, 5}, []int{3, 4, 5}},
		{[]int{1, 2, 3, 4, 5, 6}, []int{4, 5, 6}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			head := ListNodeFromArray(c.nums)
			result := MiddleLinkedListNode(head)
			outcome := ArrayFromListNode(result)
			if !reflect.DeepEqual(outcome, c.expected) {
				t.Errorf("MiddleLinkedListNode(%d) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
