package medium

import (
	"testing"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func TestTopFrequentWords(t *testing.T) {
	cases := []struct {
		words    []string
		k        int
		expected []string
	}{
		{[]string{"i", "love", "leetcode", "i", "love", "coding"}, 2, []string{"i", "love"}},
		{[]string{"i", "love", "leetcode", "i", "love", "coding"}, 3, []string{"i", "love", "coding"}},
		{[]string{"the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"}, 4, []string{"the", "is", "sunny", "day"}},
		{[]string{"hello", "hello", "hello"}, 1, []string{"hello"}},
		{[]string{"a", "b", "c", "d"}, 4, []string{"a", "b", "c", "d"}},
		{[]string{"apple", "banana", "apple", "banana", "cherry", "cherry"}, 3, []string{"apple", "banana", "cherry"}},
		{[]string{"x", "y", "z"}, 1, []string{"x"}},
		{[]string{}, 0, []string{}},
		{[]string{"a", "aa", "aaa", "a", "aaa", "aaa", "aa", "b", "b", "b"}, 3, []string{"aaa", "b", "a"}},
		{[]string{"one", "two"}, 2, []string{"one", "two"}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := TopFrequentWords(c.words, c.k)
			if !core.StringSlicesEqual(result, c.expected) {
				t.Errorf("TopFrequentWords(%v, %d) == %v, expected %v", c.words, c.k, result, c.expected)
			}

		})

	}
}
