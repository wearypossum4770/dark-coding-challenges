package easy

import (
	"fmt"
	"testing"
)

func TestIsPangram(t *testing.T) {
	cases := []struct {
		criteria string
		expected bool
		text     string
	}{
		{"empty sentence", false, ""},
		{"perfect lower case", true, "abcdefghijklmnopqrstuvwxyz"},
		{"only lower case", true, "the quick brown fox jumps over the lazy dog"},
		{"missing the letter 'x'", false, "a quick movement of the enemy will jeopardize five gunboats"},
		{"missing the letter 'h'", false, "five boxing wizards jump quickly at it"},
		{"with underscores", true, "the_quick_brown_fox_jumps_over_the_lazy_dog"},
		{"with numbers", true, "the 1 quick brown fox jumps over the 2 lazy dogs"},
		{"missing letters replaced by numbers", false, "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"},
		{"mixed case and punctuation", true, "\"Five quacking Zephyrs jolt my wax bed.\""},
		{"a-m and A-M are 26 different characters but not a pangram", false, "abcdefghijklm ABCDEFGHIJKLM"},
		{"non-alphanumeric printable ASCII", false, " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"},
	}
	for _, c := range cases {
		t.Run(fmt.Sprintf("criteria: %s", c.criteria), func(t *testing.T) {
			t.Parallel()
			result := IsPangram(c.text)
			if result != c.expected {
				t.Errorf("IsPangram(%s) == %v, expected %v", c.text, result, c.expected)
			}

		})

	}
}
