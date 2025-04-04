package easy

import (
	"reflect"
	"testing"
)

func TestReverseString(t *testing.T) {
	cases := []struct {
		input    []rune
		expected []rune
	}{
		{[]rune{'h', 'e', 'l', 'l', 'o'}, []rune{'o', 'l', 'l', 'e', 'h'}},
		{[]rune{'a', 'b', 'c', 'd'}, []rune{'d', 'c', 'b', 'a'}},
		{[]rune{'z'}, []rune{'z'}},
		{[]rune{}, []rune{}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			ReverseString(c.input)
			if !reflect.DeepEqual(c.input, c.expected) {
				t.Errorf("ReverseString(%d) is expected %v", c.input, c.expected)
			}

		})

	}
}
