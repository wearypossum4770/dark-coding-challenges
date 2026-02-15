package easy

import (
	"testing"
)

func TestMaxDepth(t *testing.T) {
	cases := []struct {
		nums     string
		expected int
	}{
		{"3,9,20,nil,nil,15,7", 3},
		{"1,nil,2", 2},
		{"1", 1},
		{"", 0},
		{"1,2, nil, 3, nil, 4, nil, 5", 5},
		{"1, nil, 2, nil, 3, nil, 4, nil, 5", 5},
		{"1,2,3,4,5,6,7", 3},
		{"1,2,3,4,5,6,nil", 3},
		{"5,4,6,3,nil,nil,7,nil,2", 4},
		{"-100,-100,-100,-100,-100", 3},
		{"0", 1},
		{"100", 1},
		{"10,20,nil,30,nil,40,nil,50", 5},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			root := BuildTreeFromString(c.nums)
			result := MaxDepth(root)
			if result != c.expected {
				t.Errorf("MaxDepth(%q) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
