package easy

import (
	"testing"
)

func TestSumOfLeftLeaves(t *testing.T) {
	cases := []struct {
		nums     string
		expected int
	}{
		{"", 0},
		{"1", 0},
		{"1 2", 2},
		{"1 x 3", 0},
		{"1 2 3", 2},
		{"3 9 20 x x 15 7", 24},
		{"1 2 x 3 x 4", 4},
		{"1 x 2 x 3 x 4", 0},
		{"1 2 3 4 5", 4},
		{"1 2 3 x 4", 0},
		{"0 -1 -2", -1},
		{"1 2 x x 3 x", 0},
		{"1 x 2 3", 3},
		{"1 2 3 4 x x 5", 4},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			root := BuildTreeFromString(c.nums)
			result := SumOfLeftLeaves(root)
			if result != c.expected {
				t.Errorf("\n\tGiven: the tree %q, SumOfLeftLeaves(%v) == %v, expected %v", c.nums, root, result, c.expected)
			}
		})
	}
}
