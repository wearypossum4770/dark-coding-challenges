package medium

import (
	"maps"
	"slices"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func TopFrequentWords(words []string, k int) []string {
	freq := make(map[string]*core.Concordance)
	for _, word := range words {
		if _, exists := freq[word]; !exists {
			freq[word] = &core.Concordance{Word: word}
		}
		freq[word].Count++
	}

	buckets := slices.Collect(maps.Values(freq))

	slices.SortFunc(buckets, func(lhs, rhs *core.Concordance) int {
		if lhs.Count > rhs.Count {
			return -1
		}
		if lhs.Count < rhs.Count {
			return 1
		}
		// 2. same frequency → sort lexicographically ascending
		if lhs.Word < rhs.Word {
			return -1
		}
		if lhs.Word > rhs.Word {
			return 1
		}
		return 0
	})
	result := make([]string, 0, k)
	for i := range k {
		result = append(result, buckets[i].Word)
	}
	return result
}
