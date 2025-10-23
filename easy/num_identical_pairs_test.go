package easy

import (
	"testing"
)

func TestNumIdenticalPairs(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{1, 1, 1, 1}, 6},
		{[]int{1, 2, 3}, 0},
		{[]int{1, 2, 3, 1, 1, 3}, 4},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := NumIdenticalPairs(c.nums)
			if result != c.expected {
				t.Errorf("NumIdenticalPairs(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
