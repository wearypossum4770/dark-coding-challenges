package easy

import (
	"testing"
)

func TestHeightChecker(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{1, 1, 4, 2, 1, 3}, 3},
		{[]int{5, 1, 2, 3, 4}, 5},
		{[]int{1, 2, 3, 4, 5}, 0},
		{[]int{10, 6, 6, 10, 10, 9, 8, 8, 3, 3, 8, 2, 1, 5, 1, 9, 5, 2, 7, 4, 7, 7}, 22},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := HeightChecker(c.nums)
			if result != c.expected {
				t.Errorf("HeightChecker(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
