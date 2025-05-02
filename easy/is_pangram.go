package easy

import (
	"strings"
)

func IsPangram(text string) bool {
	letterSet := make(map[rune]bool)
	for _, char := range strings.ToLower(text) {
		if char >= 'a' && char <= 'z' {
			letterSet[char] = true
		}
	}
	return len(letterSet) == 26
}
