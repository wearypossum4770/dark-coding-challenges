package medium

import (
	"testing"
)

func TestRemoveDuplicateLetters(t *testing.T) {
	cases := []struct {
		s        string
		expected string
	}{

		{"bcabc", "abc"},
		{"cbacdcbc", "acdb"},
		{"a", "a"},
		{"aa", "a"},
		{"aaa", "a"},
		{"ab", "ab"},
		{"ba", "ba"},
		{"abc", "abc"},
		{"cba", "cba"},
		{"abab", "ab"},
		{"bbcaac", "bac"},
		{"ecbacba", "eacb"},
		{"leetcode", "letcod"},
		{"cdadabcc", "adbc"},
		{"bcab", "bca"},
		{"cbac", "bac"},
		{"zxyxz", "xyz"},
		{"aaaaabbbbbccccc", "abc"},
		{"abcdefghijklmnopqrstuvwxyz", "abcdefghijklmnopqrstuvwxyz"},
		{"zyxwvutsrqponmlkjihgfedcba", "zyxwvutsrqponmlkjihgfedcba"},
		{"bcbcbcbc", "bc"},
		{"abacb", "abc"},
		{"aabbcc", "abc"},
		{"ccbbaa", "cba"},
		{"abababab", "ab"},
		{"abcabcabc", "abc"},
		{"edebbed", "bed"},
		{"thesqtitxyetpxloeevdeqifkz", "hesitxyplovdqfkz"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := RemoveDuplicateLetters(c.s)
			if result != c.expected {
				t.Errorf("RemoveDuplicateLetters(%q) == %q, expected %q", c.s, result, c.expected)
			}

		})

	}
}
