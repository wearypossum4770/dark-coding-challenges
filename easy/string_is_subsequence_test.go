package easy

import (
	"strings"
	"testing"
)

func TestStringIsSubsequence(t *testing.T) {
	cases := []struct {
		s        string
		t        string
		expected bool
	}{

		{"abc", "ahbgdc", true},
		{"", "", true},
		{"", "anything", true},
		{"a", "a", true},
		{"a", "b", false},
		{"z", "abc", false},
		{"acb", "abc", false},
		{"xyz", "abcxyz", true},
		{"aaa", "aaaaaa", true},
		{"aaa", "aa", false},
		{"abc", "abc", true},
		{"abc", "a" + strings.Repeat("x", 9999) + "b" + strings.Repeat("y", 9999) + "c", true},
		{"ace", "abcde", true},
		{"aec", "abcde", false},
		{"axc", "ahbgdc", false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := StringIsSubsequence(c.s, c.t)
			if result != c.expected {
				t.Errorf("StringIsSubsequence(%v, %v) == %v, expected %v", c.s, c.t, result, c.expected)
			}

		})

	}
}
