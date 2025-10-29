package easy

import (
	// 	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"

	"reflect"
	"testing"
)

func TestSortArrayByParity(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{3, 1, 2, 4}, []int{4, 2, 1, 3}},
		{[]int{0, 1, 2}, []int{0, 2, 1}},
		{[]int{0}, []int{0}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			original := c.nums
			result := SortArrayByParity(c.nums)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("SortArrayByParity(%v) == %v, expected %v", original, result, c.expected)
			}

		})

	}
}
