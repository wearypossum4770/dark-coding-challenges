package easy

import (
	"testing"
)

func TestIsBoomerang(t *testing.T) {
	cases := []struct {
		points   [][]int
		expected bool
	}{
		{[][]int{{1, 1}, {2, 3}, {3, 2}}, true},
		{[][]int{{1, 1}, {2, 2}, {3, 3}}, false},
		{[][]int{{1, 0}, {0, 0}, {2, 0}}, false},
		{[][]int{{0, 1}, {0, 2}, {1, 2}}, true},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := IsBoomerang(c.points)
			if result != c.expected {
				t.Errorf("IsBoomerang(%v) == %t, expected %t", c.points, result, c.expected)
			}

		})

	}
}
