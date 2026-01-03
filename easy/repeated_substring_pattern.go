package easy

import "strings"

func RepeatedSubstringPattern(s string) bool {
	if len(s) < 1 {
		return true
	}
	double := strings.Repeat(s, 2)
	return strings.Contains(double[1:len(double)-1], s)
}
