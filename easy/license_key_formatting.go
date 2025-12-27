package easy

import (
	"strings"
)

func LicenseKeyFormatting(s string, k int) string {
	word := strings.ToUpper(strings.ReplaceAll(s, "-", ""))
	if len(word) < k {
		return word
	}

	result := make([]byte, len(word)+(len(word)-1)/k)
	count := 0
	left := len(result) - 1
	for i := len(word) - 1; i >= 0; i-- {
		if count == k {
			result[left] = '-'
			left--
			count = 0
		}
		count++
		result[left] = word[i]
		left--
	}
	return string(result[left+1:])
}
