package easy

import (
	"testing"
)

func TestSingleNumber(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{2, 2, 1}, 1},
		{[]int{4, 1, 2, 1, 2}, 4},
		{[]int{1}, 1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := SingleNumber(c.nums)
			if result != c.expected {
				t.Errorf("SingleNumber(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
