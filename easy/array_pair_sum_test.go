package easy

import (
	"testing"
)

func TestArrayPairSum(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{1, 4, 3, 2}, 4},
		{[]int{6, 2, 6, 5, 1, 2}, 9},
		{[]int{1, 1}, 1},
		{[]int{0, 0}, 0},
		{[]int{-1, -1}, -1},
		{[]int{10_000, 10_000}, 10_000},
		{[]int{5, 5, 5, 5}, 10},
		{[]int{7, 7, 7, 7, 7, 7}, 21},
		{[]int{1, 2, 3, 4, 5, 6}, 9},
		{[]int{6, 5, 4, 3, 2, 1}, 9},
		{[]int{-5, -4, -3, -2}, -8},
		{[]int{-10, -1, 1, 10}, -9},
		{[]int{-10_000, 10_000, -9_999, 9_999}, -1},
		{[]int{1, 100, 2, 99, 3, 98}, 100 + 3},
		{[]int{0, 0, 0, 0, 0, 0}, 0},
		{[]int{-10_000, 10_000}, -10_000},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ArrayPairSum(c.nums)
			if result != c.expected {
				t.Errorf("ArrayPairSum(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
