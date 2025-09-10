package easy

import "sort"

func HeightChecker(heights []int) int {
	count := 0
	arr := make([]int, len(heights))
	copy(arr[:], heights)
	sort.Ints(arr)

	for i := range heights {
		if heights[i] != arr[i] {
			count++
		}
	}
	return count
}
