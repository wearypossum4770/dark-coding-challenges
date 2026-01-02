package easy

import (
	"testing"
)

func TestRotateString(t *testing.T) {
	cases := []struct {
		s        string
		goal     string
		expected bool
	}{
		{"abcde", "cdeab", true},
		{"abcde", "eabcd", true},
		{"abcde", "abcde", true},
		{"abcde", "abced", false},
		{"abcde", "edcba", false},
		{"aa", "a", false},
		{"a", "aa", false},
		{"abc", "abcd", false},
		{"aaaa", "aaaa", true},
		{"aabb", "bbaa", true},
		{"aabb", "abab", false},
		{"aabb", "abba", true},
		{"defdefdefabcabc", "defdefabcabcdef", true},
		{"bbbacddceeb", "ceebbbbacdd", true},
		{"a", "a", true},
		{"a", "b", false},
		{"", "", true},
		{"abcabc", "bcabca", true},
		{"abcabc", "cabacb", false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := RotateString(c.s, c.goal)
			if result != c.expected {
				t.Errorf("RotateString(%q, %q) == %t, expected %t", c.s, c.goal, result, c.expected)
			}

		})

	}
}
