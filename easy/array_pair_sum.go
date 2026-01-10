package easy

import (
	"slices"
)

func ArrayPairSum(nums []int) int {
	total := 0
	slices.Sort(nums)
	for i := 0; i < len(nums)-1; i += 2 {
		total += nums[i]
	}
	return total
}
