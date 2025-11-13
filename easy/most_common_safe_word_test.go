package easy

import (
	"strings"
	"testing"
)

func TestMostCommonSafeWord(t *testing.T) {
	cases := []struct {
		paragraph string
		banned    []string
		expected  string
	}{
		{"Bob hit a ball, the hit BALL flew far after it was hit.", []string{"hit"}, "ball"},
		{"a.", []string{}, "a"},
		{"a b.b", []string{}, "b"},
		{"Bob. hIt, baLl", []string{"bob", "hit"}, "ball"},
		{"Apple apple APPLE!", []string{"apple"}, ""},
		{"Wow! wow? wow. really, really... REALLY!", []string{"wow"}, "really"},
		{"test test test test", []string{}, "test"},
		{"!@#$%^&*()", []string{}, ""},
		{strings.Repeat("word ", 1000), []string{}, "word"},
		{"apple banana apple banana cherry", []string{"banana"}, "apple"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := MostCommonSafeWord(c.paragraph, c.banned)
			if result != c.expected {
				t.Errorf("MostCommonSafeWord(%q, %v) == %v, expected %v", c.paragraph, c.banned, result, c.expected)
			}

		})

	}
}
