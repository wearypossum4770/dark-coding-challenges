package easy

import (
	"testing"
)

func TestThirdMax(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{

		{[]int{3, 2, 1}, 1},
		{[]int{1, 2}, 2},
		{[]int{2, 2, 3, 1}, 1},
		{[]int{1, 2, 3, 4, 5}, 3},
		{[]int{5, 4, 3, 2, 1}, 3},
		{[]int{10, 20, 30, 40}, 20},
		{[]int{5, 5, 3, 2}, 2},
		{[]int{1, 2, 2, 3, 3}, 1},
		{[]int{-1, -2, -3, -4}, -3},
		{[]int{-10, -20, -30}, -30},
		{[]int{-10, 0, 10}, -10},
		{[]int{0, -1, 1, 2}, 0},
		{[]int{4, 4, 4, 3, 3, 2}, 2},
		{[]int{-5, -1, -3}, -5},
		{[]int{-2, -1, 0, 1, 2}, 0},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ThirdMax(c.nums)
			if result != c.expected {
				t.Errorf("ThirdMax(%q) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
