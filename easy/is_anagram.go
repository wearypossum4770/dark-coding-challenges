package easy

import (
	"strings"
)

func IsAnagram(s string, t string) bool {
	if len(s) != len(t) {
		return false
	}
	freq := make(map[rune]int)
	for _, v := range strings.ToLower(s) {
		freq[v]++
	}

	for _, ch := range strings.ToLower(t) {
		if freq[ch] == 0 {
			return false
		}
		freq[ch]--
	}
	return true
}

func DetectAnagrams(word string, candidates []string) []string {
	lowerWord := strings.ToLower(word)
	valid := []string{}
	for _, candidate := range candidates {
		lowerCandidate := strings.ToLower(candidate)
		if lowerWord != lowerCandidate && IsAnagram(lowerWord, lowerCandidate) {
			valid = append(valid, candidate)
		}
	}
	return valid
}
