package easy

import (
	"testing"
)

func TestFindContentChildren(t *testing.T) {
	cases := []struct {
		children []int
		cookies  []int
		expected int
	}{
		{[]int{1, 2, 3}, []int{1, 1}, 1},
		{[]int{1, 2}, []int{1, 2, 3}, 2},
		{[]int{10, 9, 8, 7}, []int{5, 6, 7, 8}, 2},
		{[]int{}, []int{1, 2}, 0},
		{[]int{1, 2}, []int{}, 0},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindContentChildren(c.children, c.cookies)
			if result != c.expected {
				t.Errorf("FindContentChildren(%d) == %v, expected %v", c.children, result, c.expected)
			}

		})

	}
}
