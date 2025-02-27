package easy

import (
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func IsPalindrome(candidate string) bool {
	cleaned := dark_coding_challenges.FilterNonAlphaNumCharacters(candidate)
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
