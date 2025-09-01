package easy

import (
	"testing"
)

func TestFindMaxConsecutiveOnes(t *testing.T) {
	cases := []struct {
		num      []int
		expected int
	}{
		{[]int{1, 1, 0, 1, 1, 1}, 3},
		{[]int{1, 0, 1, 1, 0, 1}, 2},
		{[]int{0}, 0},
		{[]int{1}, 1},
		{[]int{1, 1, 1, 1}, 4},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindMaxConsecutiveOnes(c.num)
			if result != c.expected {
				t.Errorf("FindMaxConsecutiveOnes(%v) == %d, expected %v", c.num, result, c.expected)
			}

		})

	}
}
