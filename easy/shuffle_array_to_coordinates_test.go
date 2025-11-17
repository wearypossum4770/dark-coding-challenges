package easy

import (
	"reflect"
	"testing"
)

func TestShuffleArrayToCoordinates(t *testing.T) {
	cases := []struct {
		nums     []int
		n        int
		expected []int
	}{
		{[]int{2, 5, 1, 3, 4, 7}, 3, []int{2, 3, 5, 4, 1, 7}},
		{[]int{1, 2, 3, 4, 4, 3, 2, 1}, 4, []int{1, 4, 2, 3, 3, 2, 4, 1}},
		{[]int{1, 1, 2, 2}, 2, []int{1, 2, 1, 2}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ShuffleArrayToCoordinates(c.nums, c.n)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("ShuffleArrayToCoordinates(%v, %d) == %v, expected %v", c.nums, c.n, result, c.expected)
			}

		})

	}
}
