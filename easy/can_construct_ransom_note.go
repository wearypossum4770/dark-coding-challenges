package easy

import "strings"

func CanConstructRansomNote(ransomNote string, magazine string) bool {
	const aCode = 'a'
	var freq [26]int

	// Count letters in magazine (case-insensitive)
	for _, ch := range strings.ToLower(magazine) {
		if ch >= 'a' && ch <= 'z' {
			freq[ch-aCode]++
		}
	}

	// Subtract letters used by ransomNote
	for _, ch := range strings.ToLower(ransomNote) {
		if ch >= 'a' && ch <= 'z' {
			freq[ch-aCode]--
			if freq[ch-aCode] < 0 {
				return false
			}
		}
	}
	return true
}
