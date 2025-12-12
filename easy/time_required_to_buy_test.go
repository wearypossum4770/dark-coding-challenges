package easy

import (
	"testing"
)

func TestTimeRequiredToBuy(t *testing.T) {
	cases := []struct {
		tickets  []int
		k        int
		expected int
	}{
		{[]int{2, 3, 2}, 2, 6},
		{[]int{5, 1, 1, 1}, 0, 8},
		{[]int{1}, 0, 1},
		{[]int{1, 1, 1, 1}, 3, 4},
		{[]int{3, 3, 3}, 0, 7},
		{[]int{3, 3, 3}, 1, 8},
		{[]int{3, 3, 3}, 2, 9},
		{[]int{1, 2, 3, 4}, 3, 10},
		{[]int{4, 3, 2, 1}, 0, 10},
		{[]int{4, 3, 2, 1}, 1, 9},
		{[]int{4, 3, 2, 1}, 2, 7},
		{[]int{4, 3, 2, 1}, 3, 4},
		{[]int{100, 100, 100}, 1, 299},
		{[]int{1, 100, 1}, 1, 102},
		{[]int{2, 1}, 1, 2},
		{[]int{2, 1}, 0, 3},
		{[]int{1, 2}, 0, 1},
		{[]int{1, 2}, 1, 3},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := TimeRequiredToBuy(c.tickets, c.k)
			if result != c.expected {
				t.Errorf("TimeRequiredToBuy(%v, %d) == %v, expected %v", c.tickets, c.k, result, c.expected)
			}

		})

	}
}
