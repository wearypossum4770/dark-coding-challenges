package easy

import (
	"testing"
)

func TestCanConstructRansomNote(t *testing.T) {
	cases := []struct {
		note     string
		magazine string
		expected bool
	}{
		{"a", "b", false},
		{"aa", "aab", true},
		{"a", "a", true},
		{"aa", "ab", false},
		{"abc", "cbad", true},
		{"aa", "aa", true},
		{"aa", "aa", true},
		{"zzz", "zzzzzz", true},
		{"zzzz", "zzz", false},
		{"hello world", "dlrow olleh", true},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := CanConstructRansomNote(c.note, c.magazine)
			if result != c.expected {
				t.Errorf("CanConstructRansomNote(%v, %v) == %v, expected %v", c.note, c.magazine, result, c.expected)
			}

		})

	}
}
