package medium

import (
	"reflect"
	"testing"
)

func TestArrayStack(t *testing.T) {
	cases := []struct {
		target   []int
		n        int
		expected []string
	}{
		{[]int{1, 3}, 3, []string{"Push", "Push", "Pop", "Push"}},
		{[]int{1, 2, 3}, 3, []string{"Push", "Push", "Push"}},
		{[]int{1, 2}, 4, []string{"Push", "Push"}},
		{[]int{1}, 1, []string{"Push"}},
		{[]int{1}, 100, []string{"Push"}},
		{[]int{2}, 2, []string{"Push", "Pop", "Push"}},
		{[]int{3}, 3, []string{"Push", "Pop", "Push", "Pop", "Push"}},
		{[]int{2, 3, 4}, 4, []string{"Push", "Pop", "Push", "Push", "Push"}},
		{[]int{1, 3, 5, 7}, 7, []string{"Push", "Push", "Pop", "Push", "Push", "Pop", "Push", "Push", "Pop", "Push"}},
		{[]int{5}, 5, []string{"Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Pop", "Push"}},
		{[]int{4, 5}, 5, []string{"Push", "Pop", "Push", "Pop", "Push", "Pop", "Push", "Push"}},
		{[]int{1, 2, 4}, 4, []string{"Push", "Push", "Push", "Pop", "Push"}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ArrayStack(c.target, c.n)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("ArrayStack(%v, %d) == %v, expected %v", c.target, c.n, result, c.expected)
			}

		})

	}
}
