package medium

import "strings"

func ReverseWordsInString(s string) string {
	words := strings.Fields(strings.TrimSpace(s))
	var result []string
	reverse := len(words) - 1
	for reverse >= 0 {
		if words[reverse] != " " {
			result = append(result, words[reverse])
		}
		reverse--
	}

	return strings.Join(result, " ")
}
