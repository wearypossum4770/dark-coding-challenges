package medium

import (
	"slices"
)

type Rank struct {
	Index int
	Value string
}

func queryNumber(data []string, query []int) []Rank {
	result := make([]Rank, len(data))
	for i, word := range data {
		start := len(word) - query[1]
		if start < 0 {
			start = 0
		}
		result[i] = Rank{
			Index: i,
			Value: word[start:],
		}
	}
	return result
}
func SmallestTrimmedNumbers(nums []string, queries [][]int) []int {
	result := make([]int, len(queries))
	for i, query := range queries {
		trimmed := queryNumber(nums, query)
		slices.SortFunc(trimmed, func(a Rank, b Rank) int {
			if a.Value != b.Value {
				if a.Value < b.Value {
					return -1
				}
				if a.Value > b.Value {
					return 1
				}
				return 0
			}
			if a.Index != b.Index {
				return a.Index - b.Index
			}
			return 0
		})
		result[i] = trimmed[query[0]-1].Index
	}
	return result
}
