package easy

import (
	"fmt"
	"reflect"
	"testing"
)

func TestReverseLinkedList(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{1, 2, 3, 4, 5}, []int{5, 4, 3, 2, 1}},
		{[]int{1, 2}, []int{2, 1}},
		{[]int{}, []int{}}, // handles nil properly
	}
	for i, c := range cases {
		t.Run(fmt.Sprintf("#%02d", i), func(t *testing.T) {
			t.Parallel()
			head := ListNodeFromArray(c.nums)
			reversed := ReverseLinkedList(head)
			outcome := ArrayFromListNode(reversed)

			if !reflect.DeepEqual(outcome, c.expected) {
				t.Errorf("ReverseLinkedList(%v) == %v, expected %v", c.nums, outcome, c.expected)
			}
		})
	}
}
