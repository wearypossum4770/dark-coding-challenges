package easy

import "slices"

func FindLucky(arr []int) int {
	if len(arr) == 0 {
		return -1
	}
	nums := make([]int, slices.Max(arr)+1)
	for _, num := range arr {
		nums[num]++
	}
	for i := len(nums) - 1; i > 0; i-- {
		if nums[i] == i {
			return i
		}
	}
	return -1
}
