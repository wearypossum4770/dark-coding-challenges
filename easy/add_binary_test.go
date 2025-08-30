package easy

import (
	"testing"
)

func TestAddBinary(t *testing.T) {
	cases := []struct {
		a        string
		b        string
		expected string
	}{
		{"11", "1", "100"},
		{"1010", "1011", "10101"},
		{"0", "0", "0"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := AddBinary(c.a, c.b)
			if result != c.expected {
				t.Errorf("AddBinary(%v, %v) == %v, expected %v", c.a, c.b, result, c.expected)
			}

		})

	}
}
