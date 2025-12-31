package very_easy

import (
	"testing"
)

func TestSecondLargest(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{10, 40, 30, 20, 50}, 40},
		{[]int{25, 143, 89, 13, 105}, 105},
		{[]int{54, 23, 11, 17, 10}, 23},
		{[]int{513, 211, 131, 417, 11}, 417},
		{[]int{63, 44, 11, 22, 33, 66, 65}, 65},
		{[]int{5, 5, 3}, 3},
		{[]int{5, 5, 5, 4}, 4},
		{[]int{1, 2, 2, 1}, 1},
		{[]int{3, 3, 2, 2, 1}, 2},
		{[]int{-1, -2, -3}, -2},
		{[]int{-10, -20, -30, -40}, -20},
		{[]int{-5, -1, -3}, -3},
		{[]int{-10, 0, 10}, 0},
		{[]int{0, -1, 1}, 0},
		{[]int{-1, -1, 0}, -1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := SecondLargest(c.nums)
			if result != c.expected {
				t.Errorf("SecondLargest(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
