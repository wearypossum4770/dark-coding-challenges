package easy

import (
	"testing"
)

func TestBackspaceCompare(t *testing.T) {
	cases := []struct {
		s        string
		t        string
		expected bool
	}{
		{"y#fo##f", "y#f#o##f", true},
		{"ab#c", "ad#c", true},
		{"ab##", "c#d#", true},
		{"a#c", "b", false},
		{"a", "a", true},
		{"a", "b", false},
		{"#", "#", true},
		{"#a", "a", true},
		{"a#", "", true},
		{"a#", "#", true},
		{"##", "#", true},
		{"###", "##", true},
		{"a##", "#", true},
		{"a##", "", true},
		{"a#b", "b", true},
		{"a#b", "a", false},
		{"abc", "abc", true},
		{"abc", "abd", false},
		{"ab#c", "ab#c", true},
		{"ab##c", "c", true},
		{"a#b#c#", "", true},
		{"a#b#c#d", "d", true},
		{"a#b#c#d", "e", false},
		{"#a#b#", "", true},
		{"bxj##tw", "bxj##tw", true},
		{"bxj##tw", "bxk##tw", true},
		{"xywrrmp", "xywrrmu", false},
		{"xywrrmp", "xywrrmp", true},
		{"a###b", "b", true},
		{"a###b", "a", false},
		{"####", "", true},
		{"####", "####", true},
		{"a####", "#", true},
		{"ab####", "##", true},
		{"nzp#o#g", "b#nzp#o#g", true},
		{"bbbextm", "bbb#extm", false},
		{"ab#c#", "a", true},
		{"a#a#a#", "", true},
		{"abc##", "a", true},
		{"abc###", "", true},
		{"", "#", true},
		{"#", "", true},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := BackspaceCompare(c.s, c.t)
			if result != c.expected {
				t.Errorf("BackspaceCompare(%q, %q) == %t, expected %t", c.s, c.t, result, c.expected)
			}

		})

	}
}
