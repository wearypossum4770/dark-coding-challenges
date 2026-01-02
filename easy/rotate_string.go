package easy

import "strings"

func RotateString(s, goal string) bool {
	if len(s) != len(goal) {
		return false
	}
	return strings.Contains(strings.Repeat(s, 2), goal)
}
