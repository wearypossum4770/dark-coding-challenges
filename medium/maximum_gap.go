package medium

import "slices"

func MaximumGap(nums []int) int {
	if len(nums) < 2 {
		return 0
	}
	slices.Sort(nums)
	result := nums[1] - nums[0]
	for i := 1; i < len(nums)-1; i++ {
		result = max(result, nums[i+1]-nums[i])
	}
	return result
}
