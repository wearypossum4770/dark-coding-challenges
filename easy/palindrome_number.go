package easy

import (
	"strconv"
)

// Package easy contains “PalindromeNumber checks if the given integer is a palindrome.
// A palindrome reads the same backward as forward.
//
// Example:
//
//	fmt.Println(PalindromeNumber(121)) // Output: true
//	fmt.Println(PalindromeNumber(-121)) // Output: false
//	fmt.Println(PalindromeNumber(10)) // Output: false
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
