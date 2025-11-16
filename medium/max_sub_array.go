package medium

func MaxSubArray(nums []int) int {
	result, ending := nums[0], nums[0]
	for i := 1; i < len(nums); i++ {
		ending = max(ending+nums[i], nums[i])
		result = max(result, ending)
	}

	return result
}
