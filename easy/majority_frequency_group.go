package easy

import (
	"maps"
	"slices"
)

func MajorityFrequencyGroup(s string) string {
	freq, entries := make(map[rune]int), make(map[int]string)
	for _, char := range s {
		freq[char]++
	}
	for k, v := range freq {
		entries[v] += string(k)
	}
	keys := slices.SortedFunc(maps.Keys(entries), func(a, b int) int {
		c, d := len(entries[a]), len(entries[b])
		if c != d {
			return d - c
		}
		return b - a
	})

	return entries[keys[0]]
}
