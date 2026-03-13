package easy

import (
	"testing"
)

func TestFindLargestAltitude(t *testing.T) {
	cases := []struct {
		gain     []int
		expected int
	}{
		{[]int{-5, 1, 5, 0, -7}, 1},
		{[]int{-4, -3, -2, -1, 4, 3, 2}, 0},
		{[]int{0}, 0},
		{[]int{100}, 100},
		{[]int{-100}, 0},
		{[]int{1}, 1},
		{[]int{0, 0, 0, 0}, 0},
		{[]int{1, 2, 3, 4, 5}, 15},
		{[]int{-1, -2, -3, -4, -5}, 0},
		{[]int{5, 5, 5, 5}, 20},
		{[]int{-5, -5, -5, -5}, 0},
		{[]int{10, -20, 10}, 10},
		{[]int{1, 1, 1, 1, -100}, 4},
		{[]int{-100, 1, 1, 1, 1}, 0},
		{[]int{50, -100, 50, -100, 50}, 50},
		{[]int{100, -100, -100, -100}, 100},
		{[]int{-1, -1, -1, 1, 1}, 0},
		{[]int{1, -1, 1, -1, 1, -1}, 1},
		{[]int{1, 1, 1, 1, 1}, 5},
		{[]int{-100}, 0},
		{[]int{100}, 100},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindLargestAltitude(c.gain)
			if result != c.expected {
				t.Errorf("FindLargestAltitude(%d) == %d, expected %d", c.gain, result, c.expected)
			}

		})

	}
}
