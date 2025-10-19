package easy

import (
	"testing"
)

func TestDifferenceOfSums(t *testing.T) {
	cases := []struct {
		n        int
		m        int
		expected int
	}{
		{10, 3, 19},
		{5, 6, 15},
		{5, 1, -15},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := DifferenceOfSums(c.n, c.m)
			if result != c.expected {
				t.Errorf("DifferenceOfSums(%d, %d) == %v, expected %v", c.n, c.m, result, c.expected)
			}

		})

	}
}
