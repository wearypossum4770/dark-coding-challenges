package easy

import (
	"testing"
)

func TestLeafCountInBinaryTree(t *testing.T) {
	cases := []struct {
		nums     string
		expected int
	}{
		{"1,10,39,5", 2},
		{"4,8,10,7,x,5,1,3", 3},
		{"50,30,70,20,40,60,80,x,x,x,x,65", 4},
		{"30,25,35,20,28,x,40,x,x,27", 3},
		{"1,2,3,-1,-1,-1,-1", 4},
		{"1,2,3,x,x,x,x", 2},
		{"1,2,3,4,5,x,x,x,x,x,x", 3},
		{"10,20,30,40,50,60,70", 4},
		{"x", 0},
		{"5", 1},
		{"1,x,x", 1},
		{"1,2,x,3,x,4,x,5,x", 1},
		{"1,x,2,x,3,x,4,x,5,x,6", 1},
		{"50,30,70,20,40,60,80,x,x,x,x,x,x,x,x", 4},

		// Difficult / degenerate cases
		{"1,2,x,3,x,4,x,5,x,6,x,7,x,8,x,9,x,10", 1},
		{"-5,-8,-3,-12,-7,x,x,x,x,x,x", 3},
		{"100000,99999,1,2,x,x,x,3,4,5,6", 4},
		{"-42,42,-42,42,-42,42,-42", 4},
		{"7,x,8,x,9,x,10,x,11,x,12,x,13", 1},
		{"1,2,3,x,x,x,4,x,x,x,x,x,x,x,5", 2},
		{"99999,x,x", 1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			root := BuildTreeFromString(c.nums)
			result := LeafCountInBinaryTree(root)
			if result != c.expected {
				t.Errorf("LeafCountInBinaryTree(%q) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
