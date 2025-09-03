package easy

import (
	"reflect"
	"testing"
)

func TestRemoveDuplicateZeros(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{1, 0, 2, 3, 0, 4, 5, 0}, []int{1, 0, 0, 2, 3, 0, 0, 4}},
		{[]int{1, 2, 3}, []int{1, 2, 3}},
		{[]int{0, 0, 0}, []int{0, 0, 0}},
		{[]int{0}, []int{0}},
		{[]int{7}, []int{7}},
		{[]int{1, 2, 0}, []int{1, 2, 0}},
		{[]int{0, 1, 0, 2, 0, 3}, []int{0, 0, 1, 0, 0, 2}},
	}
	for _, c := range cases {
		original := c.nums
		t.Run("", func(t *testing.T) {
			RemoveDuplicateZeros(c.nums)
			if !reflect.DeepEqual(c.nums, c.expected) {
				t.Errorf("RemoveDuplicateZeros(%v), mutated to %v expected %v", original, c.nums, c.expected)
			}
		})
	}
}
