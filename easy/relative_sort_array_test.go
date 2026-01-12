package easy

import (
	"reflect"
	"testing"
)

func TestRelativeSortArray(t *testing.T) {
	cases := []struct {
		arr1     []int
		arr2     []int
		expected []int
	}{
		{[]int{2, 3, 1, 3, 2, 4, 6, 7, 9, 2, 19}, []int{2, 1, 4, 3, 9, 6}, []int{2, 2, 2, 1, 4, 3, 3, 9, 6, 7, 19}},
		{[]int{28, 6, 22, 8, 44, 17}, []int{22, 28, 8, 6}, []int{22, 28, 8, 6, 17, 44}},
		{[]int{5, 3, 8, 1, 9, 2}, []int{}, []int{1, 2, 3, 5, 8, 9}},
		{[]int{5, 5, 2, 2, 8, 8}, []int{2, 5, 8}, []int{2, 2, 5, 5, 8, 8}},
		{[]int{42}, []int{42}, []int{42}},
		{[]int{100, 1, 100, 2}, []int{1, 2}, []int{1, 2, 100, 100}},
		{[]int{3, 3, 3, 3, 3}, []int{3}, []int{3, 3, 3, 3, 3}},
		{[]int{0}, []int{0}, []int{0}},
		{[]int{}, []int{1, 2, 3}, []int{}},
		{[]int{7, 1, 7, 1, 7}, []int{7, 1}, []int{7, 7, 7, 1, 1}},
		{[]int{999, 0, 500, 1000, 0}, []int{0, 1000}, []int{0, 0, 1000, 500, 999}},
		{[]int{1, 2, 3, 4, 5}, []int{5, 4, 3, 2, 1}, []int{5, 4, 3, 2, 1}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := RelativeSortArray(c.arr1, c.arr2)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("RelativeSortArray(%v, %v) == %v, expected %v", c.arr1, c.arr2, result, c.expected)
			}

		})

	}
}
