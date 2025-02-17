package easy

import (
	"strconv"
)

func PalindromeNumber(x int) bool {
	if x < 0 || (x%10 == 0 && x != 0) {
		return false
	}
	value := strconv.Itoa(x)
	right := len(value) - 1
	left := 0
	for left < right {
		if value[left] != value[right] {
			return false
		}
		left += 1
		right -= 1
	}
	return true
}
