package easy

import (
	"testing"
)

var criteria = "Given roman numeral calculate appropriate arabic numeral"
var romanTestCases = []struct {
	roman  string
	arabic int
}{
	{"IV", 4},
	{"XC", 90},
	{"CM", 900},
	{"MMM", 3_000},
	{"III", 3},
	{"XXVII", 27},
	{"LVIII", 58},
	{"MCMXCIV", 1_994},
	{"MMMCMXCIV", 3_994},
	{"I", 1},
	{"VIII", 8},
	{"XXIX", 29},
	{"LIV", 54},
	{"CCV", 205},
	{"CDXLIV", 444},
	{"CMXCIX", 999},
	{"M", 1_000},
	{"MMMDCCCLXXXVIII", 3_888},
	{"MMMCMX", 3_910},
}

func TestRomanToInt(t *testing.T) {
	for _, c := range romanTestCases {
		t.Run(criteria, func(t *testing.T) {
			t.Parallel()
			result := RomanToInt(c.roman)
			if result != c.arabic {
				t.Errorf("RomanToInt(%s) == %v, expected %v", c.roman, result, c.arabic)
			}
		})
	}
}
