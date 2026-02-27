package easy

import (
	"maps"
	"slices"
)

func CountSetBits(n int) int {
	count := 0
	for n != 0 {
		count += n & 1
		n >>= 1
	}
	return count
}
func SortByBits(arr []int) []int {
	freq := make(map[int][]int)
	for _, num := range arr {
		count := CountSetBits(num)
		freq[count] = append(freq[count], num)
	}
	for _, v := range freq {
		slices.Sort(v)
	}
	result := make([]int, 0, len(arr))
	for _, v := range slices.Sorted(maps.Keys(freq)) {
		result = append(result, freq[v]...)
	}
	return result
}
