package very_easy

import (
	"testing"
)

func TestArraySum(t *testing.T) {
	cases := []struct {
		array    []int
		expected int
	}{
		{[]int{12, 58, 7, 42, 79}, 198},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ArraySum(c.array)
			if result != c.expected {
				t.Errorf("ArraySum(%d) == %v, expected %v", c.array, result, c.expected)
			}
		})
	}
}
