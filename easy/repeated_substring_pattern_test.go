package easy

import (
	"testing"
)

func TestRepeatedSubstringPattern(t *testing.T) {
	cases := []struct {
		s        string
		expected bool
	}{
		{"a", false},
		{"aa", true},
		{"ab", false},
		{"aba", false},
		{"abab", true},
		{"ababba", false},
		{"abcabc", true},
		{"abcabcabcabc", true},
		{"abcdabcd", true},
		{"abcdabce", false},
		{"aaaaaaaa", true},
		{"aaaaaaab", false},
		{"abaababaab", true},
		{"abaaba", true},
		{"abaabab", false},
		{"xyzxyzxyz", true},
		{"xyzxy", false},
		{"zz", true},
		{"z", false},
		{"ababababx", false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := RepeatedSubstringPattern(c.s)
			if result != c.expected {
				t.Errorf("RepeatedSubstringPattern(%q) == %t, expected %t", c.s, result, c.expected)
			}

		})

	}
}
