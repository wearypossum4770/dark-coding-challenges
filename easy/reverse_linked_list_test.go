package easy

import (
	"reflect"
	"testing"
)

func TestReverseLinkedList(t *testing.T) {
	cases := []struct {
		nums     *ListNode[int]
		expected *ListNode[int]
	}{
		{BuildList([]int{1, 2, 3, 4, 5}), BuildList([]int{5, 4, 3, 2, 1})},
		{BuildList([]int{1, 2}), BuildList([]int{2, 1})},
		{BuildList([]int{}), BuildList([]int{})},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			t.Parallel()
			input, output := ListToSlice(c.nums), ListToSlice(c.expected)

			result := ReverseLinkedList(c.nums)
			if !reflect.DeepEqual(input, output) {
				t.Errorf("ReverseLinkedList(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
