package medium

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"

	"testing"
)

func TestTopFrequentElements(t *testing.T) {
	cases := []struct {
		nums     []int
		k        int
		expected []int
	}{
		{[]int{1, 1, 1, 2, 2, 3}, 2, []int{1, 2}},
		{[]int{1}, 1, []int{1}},
		{[]int{1, 2, 1, 2, 1, 2, 3, 1, 3, 2}, 2, []int{1, 2}},
		{[]int{}, 0, []int{}},
		{[]int{5}, 1, []int{5}},
		{[]int{1, 1, 1, 1}, 1, []int{1}},
		{[]int{-1, -1}, 1, []int{-1}},
		{[]int{-1, -1, 2, 2, 3}, 2, []int{-1, 2}},
		{[]int{4, 4, 4, 4, 1, 2, 3}, 1, []int{4}},
		{[]int{1, 1, 2, 2, 2, 3, 3, 1, 1, 1}, 2, []int{1, 2}},
		{[]int{3, 0, 1, 0, 1, 3}, 3, []int{0, 1, 3}},
		{[]int{1, 2, 3, 4}, 4, []int{1, 2, 3, 4}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := TopFrequentElements(c.nums, c.k)
			if !core.SlicesEqual(result, c.expected) {
				t.Errorf("TopFrequentElements(%v, %d) == %v, expected %v", c.nums, c.k, result, c.expected)
			}

		})

	}
}
