package medium

import (
	"testing"
)

func TestFindDuplicateNumber(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{1, 1}, 1},
		{[]int{1, 3, 4, 2, 2}, 2},
		{[]int{3, 1, 3, 4, 2}, 3},
		{[]int{3, 3, 3, 3, 3}, 3},
		{[]int{2, 1, 2}, 2},
		{[]int{1, 4, 6, 3, 2, 5, 6}, 6},
		{[]int{5, 4, 3, 2, 1, 5}, 5},
		{[]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 9}, 9},
		{[]int{2, 2, 2, 2, 2}, 2},
		{[]int{1, 1, 2, 3, 4, 5}, 1},
		{[]int{4, 3, 1, 4, 2}, 4},
		{[]int{6, 1, 5, 4, 3, 2, 6}, 6},
		{[]int{1, 2, 3, 4, 5, 3}, 3},
		{[]int{7, 6, 5, 4, 3, 2, 1, 7}, 7},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindDuplicateNumber(c.nums)
			if result != c.expected {
				t.Errorf("FindDuplicateNumber(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
