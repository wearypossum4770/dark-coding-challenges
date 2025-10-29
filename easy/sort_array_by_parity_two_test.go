package easy

import (
	"reflect"
	"testing"
)

func TestSortArrayByParityTwo(t *testing.T) {
	cases := []struct {
		nums     []int
		expected []int
	}{
		{[]int{4, 2, 5, 7}, []int{4, 5, 2, 7}},
		{[]int{2, 3}, []int{2, 3}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := SortArrayByParityTwo(c.nums)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("SortArrayByParityTwo(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
