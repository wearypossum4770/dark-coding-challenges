package easy

import (
	"testing"
)

func TestCountStudents(t *testing.T) {
	cases := []struct {
		students   []int
		sandwiches []int
		expected   int
	}{
		{[]int{1, 1, 0, 0}, []int{0, 1, 0, 1}, 9},
		{[]int{1, 1, 1, 0, 0, 1}, []int{1, 0, 0, 0, 1, 1}, 3},
		{[]int{0, 0, 0}, []int{0, 0, 0}, 0},
		{[]int{1, 1, 1}, []int{1, 1, 1}, 0},
		{[]int{1, 0, 1, 0}, []int{1, 0, 1, 0}, 0},
		{[]int{0, 1, 0, 1}, []int{1, 0, 1, 0}, 0},
		{[]int{1}, []int{0}, 1},
		{[]int{0}, []int{1}, 1},
		{[]int{0}, []int{0}, 0},
		{[]int{1}, []int{1}, 0},
		{[]int{0, 1, 0, 1, 1, 0}, []int{1, 1, 0, 0, 0, 1}, 0},
		{[]int{1, 1, 1, 1, 1}, []int{0, 0, 0, 0, 0}, 5},
		{[]int{0, 0, 0, 0, 0}, []int{1, 1, 1, 1, 1}, 5},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := CountStudents(c.students, c.sandwiches)
			if result != c.expected {
				t.Errorf("CountStudents(%v, %v) == %d, expected %d", c.students, c.sandwiches, result, c.expected)
			}

		})

	}
}
