package medium

import (
	"maps"
	"slices"
	"strings"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

type Alphabet struct {
	Letter rune
	Count  int
}

func FrequencySort(s string) string {
	result := make(map[rune]Alphabet)
	var sb strings.Builder

	for _, char := range s {
		if core.CharToDigit(char) == -1 {
			continue
		}
		count := result[char]
		count.Letter = char
		count.Count++
		result[char] = count
	}
	target := slices.Collect(maps.Values(result))
	slices.SortFunc(target, func(a, b Alphabet) int {
		if b.Count != a.Count {
			return b.Count - a.Count
		}
		if a.Letter < b.Letter {
			return -1
		} else if a.Letter > b.Letter {
			return 1
		}
		return 0
	})
	for _, char := range target {
		for range char.Count {
			sb.WriteRune(char.Letter)
		}
	}
	return sb.String()
}
