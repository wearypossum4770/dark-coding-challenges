package easy

import (
	"reflect"
	"testing"
)

func TestGetArrayConcatenation(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{1, 2, 1}, []int{1, 2, 1, 1, 2, 1}},
		{[]int{1, 3, 2, 1}, []int{1, 3, 2, 1, 1, 3, 2, 1}},
		{[]int{1}, []int{1, 1}},
		{[]int{1000}, []int{1000, 1000}},
		{[]int{1, 1, 1}, []int{1, 1, 1, 1, 1, 1}},
		{[]int{2, 4, 6}, []int{2, 4, 6, 2, 4, 6}},
		{[]int{5, 10}, []int{5, 10, 5, 10}},
		{[]int{0, 1, 0}, []int{0, 1, 0, 0, 1, 0}},
		{[]int{1, 2, 3, 2, 1}, []int{1, 2, 3, 2, 1, 1, 2, 3, 2, 1}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := GetArrayConcatenation(c.nums)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("GetArrayConcatenation(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
