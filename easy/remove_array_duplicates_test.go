package easy

import (
	"testing"
)

func TestRemoveArrayDuplicates(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{1, 1, 2}, 2},
		{[]int{1, 2, 2, 3, 3}, 3},
		{[]int{1, 1, 2, 2, 3, 3, 4}, 4},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := RemoveArrayDuplicates(&c.nums)
			if result != c.expected {
				t.Errorf("RemoveArrayDuplicates(%d) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
