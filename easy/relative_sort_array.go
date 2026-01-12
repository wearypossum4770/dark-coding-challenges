package easy

import (
	"maps"
	"slices"
)

func RelativeSortArray(arr1, arr2 []int) []int {
	result := make([]int, len(arr1))
	freq := make(map[int]int)
	index := 0
	for _, num := range arr1 {
		freq[num]++
	}
	for _, num := range arr2 {
		count := freq[num]
		for count > 0 {
			result[index] = num
			count--
			index++
		}
		delete(freq, num)
	}

	for _, key := range slices.Sorted(maps.Keys(freq)) {
		count := freq[key]
		for count > 0 {
			count--
			result[index] = key
			index++
		}
	}
	return result
}
