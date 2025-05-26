package easy

import (
	"fmt"
	"testing"
)

func TestArmstrongNumbers(t *testing.T) {
	cases := []struct {
		num      int
		expected int
	}{
		{2, 1},
		{89, 0},
		{0, 1},
		{39, 0},
		{555, 0},
		{9475, 0},
		{9926315, 1},
		{93084, 1},
		{548834, 1},
		{2147483647, 0},
		{365, 0},
		{120, 0},
		{1253, 0},
		{153, 1},
		{-153, 0},
		{407, 1},
		{370, 1},
		{371, 1},
		{1634, 1},
		{8208, 1},
		{9474, 1},
	}
	for _, c := range cases {
		t.Run(fmt.Sprintf("\n\tGiven: the integer %d.\n\tThen: it is an Armstrong number %p", c.num, &c.expected), func(t *testing.T) {
			t.Parallel()
			result := ArmstrongNumbers(c.num)
			if result != c.expected {
				t.Errorf("ArmstrongNumbers(%d) == %v, expected %v", c.num, result, c.expected)
			}

		})

	}
}
