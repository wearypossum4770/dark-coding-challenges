package easy

import (
	"testing"
)

func TestReverseVowels(t *testing.T) {
	cases := []struct {
		word     string
		expected string
	}{
		{"IceCreAm", "AceCreIm"},
		{"leetcode", "leotcede"},

		{"a", "a"},
		{"b", "b"},
		{"AEIOU", "UOIEA"},
		{"aeiou", "uoiea"},
		{"bcdfgh", "bcdfgh"},
		{"aA", "Aa"},
		{"a.b,e", "e.b,a"},
		{"hello world", "hollo werld"},
		{"aEiOu", "uOiEa"},
		{".,?!", ".,?!"},
		{"aaaaaa", "aaaaaa"},
		{"aAaaAa", "aAaaAa"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ReverseVowels(c.word)
			if result != c.expected {
				t.Errorf("ReverseVowels(%q) == %q, expected %q", c.word, result, c.expected)
			}

		})

	}
}
