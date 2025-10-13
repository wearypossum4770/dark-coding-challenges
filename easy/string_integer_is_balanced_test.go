package easy

import (
	"testing"
)

func TestStringIntegerIsBalanced(t *testing.T) {
	cases := []struct {
		num      string
		expected bool
	}{
		{"12", false},
		{"11", true},
		{"1234", false},
		{"24123", true},
		{"00", true},
		{"10", false},
		{"1010", false},
		{"909", false},
		{"1234567890", false},
		{"111111", true},
		{"123321", true},
		{"99999999", true},
		{"5005", true},
		{"1234567", false},
		{"1", false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := StringIntegerIsBalanced(c.num)
			if result != c.expected {
				t.Errorf("StringIntegerIsBalanced(%q) == %v, expected %v", c.num, result, c.expected)
			}

		})

	}
}
