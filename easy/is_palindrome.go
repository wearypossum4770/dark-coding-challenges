package easy

import (
	"strings"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func IsPalindrome(candidate string) bool {
	cleaned := core.FilterToAlphaNumericLowercase(candidate)
	start, end := 0, len(cleaned)-1
	for start < end {
		if cleaned[start] != cleaned[end] {
			return false
		}
		start++
		end--
	}
	return true
}

func CountPalindromes(candidate string) int {
	total := 0
	for _, word := range strings.Split(candidate, " ") {
		if IsPalindrome(word) {
			total += 1
		}
	}
	return total
}
