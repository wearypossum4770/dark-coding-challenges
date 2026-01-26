package easy

import (
	"fmt"
	"testing"
)

func TestIsSameTree(t *testing.T) {
	cases := []struct {
		a        string
		b        string
		expected bool
	}{
		{"1 2 x x 3 x x", "1 2 x x 3 x x", true},
		{"1 2 x x 3 x x", "1 2 x x x", false},
		{"1 2 x x 3 x x", "1 x 2 x x", false},
		{"1 2 3 x x x x", "1 x 2 x 3 x x", false},
		{"x", "x", true},
		{"1 x x", "x", false},
		{"1 x x", "1 x x", true},
		{"1 x x", "2 x x", false},
		{"1 2 x x x", "1 x 2 x x", false},
		{"1 2 3 x x x x", "1 2 3 x x x x", true},
		{"1 2 3 x x x x", "1 2 4 x x x x", false},
		{"5 3 1 x x 4 x x 7 6 x x 9 x x", "5 3 1 x x 4 x x 7 6 x x 9 x x", true},
		{"1 2 4 x x 5 x x 3 6 x x 7 x x", "1 2 4 x x 5 x x 3 6 x x 8 x x", false},
		{"1 2 x x 3 x x", "1 x 2 x 3 x x", false},
		{"10 5 2 x x 7 x x 15 12 x x 20 x x", "10 5 2 x x 7 x x 15 12 x x 20 x x", true},
		{"1 x 2 x 3 x 4 x x", "1 x 2 x 3 x 4 x x", true},
		{"4 3 2 1 x x x x x", "4 3 2 1 x x x x x", true},
		{"8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
			"8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x", true,
		},
		{"3 x 4 x 5 x 6 x x", "3 x 4 x 5 x 7 x x", false},
		{"100 50 25 x x 75 x x 150 125 x x 175 x x", "100 50 25 x x 75 x x 150 125 x x 175 x x", true},
	}
	for _, c := range cases {
		p := BuildTreeFromString(c.a)
		q := BuildTreeFromString(c.b)
		t.Run(fmt.Sprintf("\nGiven: the tree data %s and %s", c.a, c.b), func(t *testing.T) {
			result := IsSameTree(p, q)
			if result != c.expected {
				t.Errorf("IsSameTree(%v, %v) == %t, expected %t", p, q, result, c.expected)
			}

		})

	}
}
