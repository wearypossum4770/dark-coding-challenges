package easy

import (
	"testing"
)

func TestFindLucky(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{2, 2, 3, 4}, 2},
		{[]int{1, 2, 2, 3, 3, 3}, 3},
		{[]int{2, 2, 2, 3, 3}, -1},
		{[]int{5, 5, 5, 5, 5}, 5},
		{[]int{7, 7, 7, 7, 7, 7}, -1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindLucky(c.nums)
			if result != c.expected {
				t.Errorf("FindLucky(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
