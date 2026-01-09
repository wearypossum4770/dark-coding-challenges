package easy

import (
	"testing"
)

func TestCanMakeArithmeticProgression(t *testing.T) {
	cases := []struct {
		nums     []int
		expected bool
	}{

		{[]int{3, 5, 1}, true},
		{[]int{1, 2, 4}, false},
		{[]int{-68, -96, -12, -40, 16}, true},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := CanMakeArithmeticProgression(c.nums)
			if result != c.expected {
				t.Errorf("CanMakeArithmeticProgression(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
