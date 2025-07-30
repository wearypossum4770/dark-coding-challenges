package easy

import (
	"testing"
)

func TestFindTheDifference(t *testing.T) {
	cases := []struct {
		s        string
		t        string
		expected byte
	}{
		{"abcd", "abcde", 'e'},
		{"", "y", 'y'},
		{"a", "aa", 'a'},
		{"aabbcc", "aabbccd", 'd'},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := FindTheDifference(c.s, c.t)
			if result != c.expected {
				t.Errorf("FindTheDifference(%v, %v) == %v, expected %v", c.s, c.t, result, c.expected)
			}

		})

	}
}
