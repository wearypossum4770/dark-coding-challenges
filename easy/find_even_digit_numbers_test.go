package easy

import (
	"testing"
)

func TestFindEvenDigitNumbers(t *testing.T) {
	cases := []struct {
		nums     []int
		expected int
	}{
		{[]int{12, 345, 2, 6, 7896}, 2},
		{[]int{555, 901, 482, 1771}, 1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindEvenDigitNumbers(c.nums)
			if result != c.expected {
				t.Errorf("FindEvenDigitNumbers(%v) == %d, expected %d", c.nums, result, c.expected)
			}

		})

	}
}
