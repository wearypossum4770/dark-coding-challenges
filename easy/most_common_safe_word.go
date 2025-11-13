package easy

import (
	"maps"
	"slices"
	"strings"
	"unicode"
)

type Concordance struct {
	Word      string
	Frequency int
}

func MostCommonSafeWord(paragraph string, banned []string) string {
	freq := make(map[string]Concordance)
	words := strings.FieldsFunc(strings.ToLower(paragraph), func(r rune) bool {
		return !unicode.IsLetter(r)
	})
	for _, word := range words {
		if !slices.Contains(banned, word) && word != "" {
			count := freq[word]
			count.Word = word
			count.Frequency++
			freq[word] = count
		}
	}
	result := slices.Collect(maps.Values(freq))

	slices.SortFunc(result, func(a, b Concordance) int {
		return b.Frequency - a.Frequency
	})
	if len(result) == 0 {
		return ""
	}
	return result[0].Word

}
