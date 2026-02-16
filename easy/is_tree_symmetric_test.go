package easy

import (
	"testing"
)

func TestIsTreeSymmetric(t *testing.T) {
	cases := []struct {
		nums     string
		expected bool
	}{
		{"1,2,2,3,4,4,3,5,6,7,8,8,7,6,5", true},
		{"1,2,2,3,4,4,3", true},
		{"", true},
		{"1", true},
		{"1,2,2", true},
		{"1,2,3", false},
		{"1,2,2,3,4,4,3", true},
		{"1,2,2,3,4,4,5", false},
		{"1,2,2,3,null,null,3", true},
		{"1,2,2,null,3,null,3", false},
		{"1,2,2,3,3,null,null", false},
		{"1,null,null", true},
		{"1,2,null", false},
		{"1,null,2", false},
		{"1,2,2,3,4,null,4,5,6,null,null,6,5", false},
		{"1,2,2,3,4,null,4,5,6,null,null,7,5", false},
		{"0", true},
		{"0,0,0", true},
		{"0,0,1", false},
		{"1,2,2,2,2,2,2", true},
		{"1,2,3,4,5,6,7", false},
		{"1,2,2,3,3,3,3,4,4,4,4,4,4,4,4", true},
		{"5,4,4,3,3,3,3,2,2,2,2,2,2,2,2", true},
		{"1,2,null,3,null,null,null", false},
		{"1,null,null,null,null,null,null", true},
		{"2,3,3,4,5,5,4,6,7,8,8,7,6", false},
		{"1,2,2,3,4,4,3,5,6,7,8,8,7,6,5", true},
		{"1,2,2,3,4,4,3,5,6,7,8,8,7,6,6", false},
		{"1,1,1,1,1,1,1,1,1,1,1,1,1,1,1", true},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			root := BuildTreeFromString(c.nums)
			result := IsTreeSymmetric(root)
			if result != c.expected {
				t.Errorf("IsTreeSymmetric(%q) == %t, expected %t", c.nums, result, c.expected)
			}

		})

	}
}
