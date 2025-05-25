package easy

import (
	"strings"
)

func ToGoatLatin(sentence string) string {
	if len(sentence) == 0 {
		return ""
	}
	result := strings.Fields(sentence)
	for i, word := range strings.Fields(sentence) {
		suffix := strings.Repeat("a", i+1)
		if isVowel(word[0]) {
			result[i] = word + "ma" + suffix
		} else {
			result[i] = word[1:] + string(word[0]) + "ma" + suffix
		}
	}
	return strings.Join(result, " ")
}

func isVowel(ch byte) bool {
	return ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u' ||
		ch == 'A' || ch == 'E' || ch == 'I' || ch == 'O' || ch == 'U'
}
