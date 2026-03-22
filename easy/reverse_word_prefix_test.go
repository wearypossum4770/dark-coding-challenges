package easy

import (
	"testing"
)

func TestReverseWordPrefix(t *testing.T) {
	cases := []struct {
		word     string
		char     byte
		expected string
	}{
		{"abcdefd", 'd', "dcbaefd"},
		{"xyxzxe", 'z', "zxyxxe"},
		{"abcd", 'z', "abcd"},
		{"abcde", 'a', "abcde"},
		{"aabcd", 'a', "aabcd"},
		{"abcde", 'e', "edcba"},
		{"a", 'a', "a"},
		{"a", 'b', "a"},
		{"aabcaad", 'a', "aabcaad"},
		{"abacaba", 'c', "cabaaba"},
		{"abcdabcd", 'd', "dcbaabcd"},
		{"dcba", 'a', "abcd"},
		{"ba", 'a', "ab"},
		{"aaaa", 'a', "aaaa"},
		{"aaaa", 'b', "aaaa"},
		{"abcde", 'b', "bacde"},
		{"abcde", 'd', "dcbae"},
		{"ab", 'a', "ab"},
		{"ab", 'b', "ba"},
		{"ab", 'z', "ab"},
		{"racecar", 'e', "ecarcar"},
		{"racecar", 'r', "racecar"},
		{"aabba", 'b', "baaba"},
		{"mnopqrstu", 'u', "utsrqponm"},
		// {"абвгд", 'а', "абвгд"},
		// {"абвгд", 'д', "дгвба"},
		// {"абвгд", 'я', "абвгд"},
		// {"абвгде", 'г', "гвбаде"},
		//{"абагд", 'а', "абагд"}, // not byte
		//{"а", 'а', "а"}, // not byte
		//{"а", 'б', "а"}, // not byte
		// {"дгвба", 'а', "абвгд"},
		// {"ба", 'а', "аб"},
		//{"аб", 'а', "аб"}, //not byte
		// {"аб", 'б', "ба"},
		// {"шалаш", 'л', "лашаш"},
		//{"аааа", 'а', "аааа"}, // not byte
		//{"аааа", 'б', "аааа"}, // not byte
		//{"abcde", 'а', "abcde"}, // not byte
		// {"абвгдеёж", 'ж', "жёедгвба"},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ReverseWordPrefix(c.word, c.char)
			if result != c.expected {
				t.Errorf("ReverseWordPrefix(%q, %q) == %q, expected %q", c.word, c.char, result, c.expected)
			}

		})

	}
}
