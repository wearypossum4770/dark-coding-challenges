package easy

import (
	"testing"
)

func TestMajorityElement(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{2, 1, 2}, 2},
		{[]int{100}, 100},
		{[]int{2, 1, 1}, 1},
		{[]int{3, 2, 3}, 3},
		{[]int{2, 2, 1, 1, 1, 2, 2}, 2},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			t.Parallel()
			result := MajorityElement(c.nums)
			if result != c.expected {
				t.Errorf("MajorityElement(%d) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
