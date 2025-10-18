package easy

import (
	"reflect"
	"testing"
)

func TestPlusOne(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{4, 3, 2, 1}, []int{4, 3, 2, 2}},
		{[]int{1, 2, 3}, []int{1, 2, 4}},
		{[]int{9}, []int{1, 0}},
		{[]int{9, 9}, []int{1, 0, 0}},
		{[]int{0}, []int{1}},
		{[]int{5}, []int{6}},
		{[]int{9, 9, 9, 9}, []int{1, 0, 0, 0, 0}},
		{[]int{9, 9, 8}, []int{9, 9, 9}},
		{[]int{1, 0, 0}, []int{1, 0, 1}},
		{[]int{8, 9, 9}, []int{9, 0, 0}},
		{[]int{0, 9}, []int{1, 0}},
		{[]int{1, 9, 9}, []int{2, 0, 0}},
		{[]int{9, 9, 9, 9, 9}, []int{1, 0, 0, 0, 0, 0}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := PlusOne(c.nums)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("PlusOne(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
