package easy

import (
	"fmt"
	"testing"
)

type RemoveElementCase struct {
	nums     []int
	val      int
	result   []int
	expected int
}

func TestRemoveElement(t *testing.T) {
	cases := []RemoveElementCase{
		{[]int{3, 2, 2, 3}, 3, []int{2, 2}, 2},
		{[]int{0, 1, 2, 2, 3, 0, 4, 2}, 2, []int{0, 1, 4, 0, 3}, 5},
		{[]int{3, 2, 2, 4, 3}, 3, []int{2, 2, 4}, 3},
		{[]int{2, 0, 1, 2, 0, 3, 2, 2, 2, 1, 0, 0, 0, 1, 0, 0, 2, 2, 2, 3, 2, 3, 1, 2, 1, 2, 2, 3, 2, 3, 0, 3, 0, 2, 1, 2, 0, 0, 3, 2, 3, 0, 3, 0, 2, 3, 2, 2, 3, 1, 3, 3, 0, 3, 3, 0, 3, 3, 2, 0, 0, 0, 0, 1, 3, 0, 3, 1, 3, 1, 0, 2, 3, 3, 3, 2, 3, 3, 2, 2, 3, 3, 3, 1, 3, 2, 1, 0, 0, 0, 1, 0, 3, 2, 1, 0, 2, 3, 0, 2, 1, 1, 3, 2, 0, 1, 1, 3, 3, 0, 1, 2, 1, 2, 2, 3, 1, 1, 3, 0, 2, 2, 2, 2, 1, 0, 2, 2, 2, 1, 3, 1, 3, 1, 1, 0, 2, 2, 0, 2, 3, 0, 1, 2, 1, 1, 3, 0, 2, 3, 2, 3, 2, 0, 2, 2, 3, 2, 2, 0, 2, 1, 3, 0, 2, 0, 2, 1, 3, 1, 1, 0, 0, 3, 0, 1, 2, 2, 1, 2, 0, 1, 0, 0, 0, 1, 1, 0, 3, 2, 3, 0, 1, 3, 0, 0, 1, 0, 1, 0, 0, 0, 0, 3, 2, 2, 0, 0, 1, 2, 0, 3, 0, 3, 3, 3, 0, 3, 3, 1, 0, 1, 2, 1, 0, 0, 2, 3, 1, 1, 3, 2}, 2, []int{0, 1, 0, 3, 1, 0, 0, 0, 1, 0, 0, 3, 3, 1, 1, 3, 3, 0, 3, 0, 1, 0, 0, 3, 3, 0, 3, 0, 3, 3, 1, 3, 3, 0, 3, 3, 0, 3, 3, 0, 0, 0, 0, 1, 3, 0, 3, 1, 3, 1, 0, 3, 3, 3, 3, 3, 3, 3, 3, 1, 3, 1, 0, 0, 0, 1, 0, 3, 1, 0, 3, 0, 1, 1, 3, 0, 1, 1, 3, 3, 0, 1, 1, 3, 1, 1, 3, 0, 1, 0, 1, 3, 1, 3, 1, 1, 0, 0, 3, 0, 1, 1, 1, 3, 0, 3, 3, 0, 3, 0, 1, 3, 0, 0, 1, 3, 1, 1, 0, 0, 3, 0, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 3, 3, 0, 1, 3, 0, 0, 1, 0, 1, 0, 0, 0, 0, 3, 0, 0, 1, 0, 3, 0, 3, 3, 3, 0, 3, 3, 1, 0, 1, 1, 0, 0, 3, 1, 1, 3}, 169},
	}

	for i, c := range cases {
		criteria := fmt.Sprintf(
			"\n\tTest Case: %d\n\tGiven: the array %v.\n\tAnd: the target %d.\n\tThen: it will have %d non-target element(s).\n\tResulting in %v",
			i, c.nums, c.val, c.expected, c.result,
		)

		t.Run(fmt.Sprintf("Case-%d", i), func(t *testing.T) {
			t.Parallel()

			// Make a copy so the original isn't modified
			nums := make([]int, len(c.nums))
			copy(nums, c.nums)

			length := RemoveElement(&nums, c.val)

			if length != c.expected {
				t.Errorf("%s\n\tLength mismatch: got %d, expected %d", criteria, length, c.expected)
			}

			actual := nums[:length]
			expected := c.result

			if !equalUnordered(actual, expected) {
				t.Errorf("%s\n\tContent mismatch: got %v, expected %v", criteria, actual, expected)
			}
		})
	}
}

// Helper to compare slices regardless of order
func equalUnordered(a, b []int) bool {
	if len(a) != len(b) {
		return false
	}
	counts := map[int]int{}
	for _, v := range a {
		counts[v]++
	}
	for _, v := range b {
		if counts[v] == 0 {
			return false
		}
		counts[v]--
	}
	return true
}
