package easy

import (
	"testing"
)

func TestDetectCapitalUse(t *testing.T) {
	cases := []struct {
		word     string
		expected bool
	}{
		{"USA", true},
		{"UsA", false},
		{"leetcode", true},
		{"Google", true},
		{"FlaG", false},
		{"g", true},
		{"G", true},
		{"LeetCode", false},
		{"aPPle", false},
		{"APPLE", true},
		{"apple", true},
		{"Apple", true},
		{"AppLe", false},
		{"zZZ", false},
		{"HELlo", false},
		{"qwerty", true},
		{"Qwerty", true},
		{"QWERTY", true},
		{"QwErTy", false},
		{"Abcdefg", true},
		{"abcdEfg", false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := DetectCapitalUse(c.word)
			if result != c.expected {
				t.Errorf("DetectCapitalUse(%q) == %t, expected %t", c.word, result, c.expected)
			}

		})

	}
}
