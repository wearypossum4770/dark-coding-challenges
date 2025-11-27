package medium

import (
	"testing"
)

func TestMaximumGap(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{3, 6, 9, 1}, 3},
		{[]int{10}, 0},
		{[]int{1, 100}, 99},
		{[]int{1, 2, 3, 4, 5}, 1},
		{[]int{10, 9, 8, 7}, 1},
		{[]int{7, 7, 7, 7}, 0},
		{[]int{0, 1_000_000_000}, 1_000_000_000},
		{[]int{1, 100, 2, 50_000_000}, 49999900},
		{[]int{1, 1}, 0},
		{[]int{2, 2, 2, 3}, 1},
		{[]int{100, 3, 2, 1}, 97},
		{[]int{1, 3, 1_000, 2_000}, 1_000},
		{[]int{8, 1, 6, 3, 9}, 3},
		{[]int{5, 4, 3, 2, 1}, 1},
		{[]int{1, 2}, 1},
		{[]int{1_000_000_000, 0, 999_999_999}, 999_999_999},
		{[]int{1, 4, 7, 13, 20, 21}, 7},
		{[]int{5, 5, 5, 10}, 5},
		{[]int{0, 1, 2, 3, 100}, 97},
		{[]int{100, 200, 300, 1_000}, 700},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := MaximumGap(c.nums)
			if result != c.expected {
				t.Errorf("MaximumGap(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
