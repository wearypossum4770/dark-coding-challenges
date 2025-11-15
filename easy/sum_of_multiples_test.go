package easy

import (
	"testing"
)

func TestSumOfMultiples(t *testing.T) {
	cases := []struct {
		num      int
		expected int
	}{
		{1, 0},
		{2, 0},
		{3, 3},
		{5, 8},
		{7, 21},
		{9, 30},
		{10, 40},
		{12, 52},
		{15, 81},
		{20, 119},
		{21, 140},
		{50, 691},
		{100, 2_838},
		{1_000, 272_066},
		{200, 10_845},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := SumOfMultiples(c.num)
			if result != c.expected {
				t.Errorf("SumOfMultiples(%d) == %d, expected %d", c.num, result, c.expected)
			}

		})

	}
}
