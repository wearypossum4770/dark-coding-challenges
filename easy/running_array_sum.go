package easy

func RunningArraySum(nums []int) []int {
	result := make([]int, len(nums))
	for i := 0; i < len(nums); i++ {
		if i == 0 {
			result[i] = nums[i]
		} else {
			result[i] = result[i-1] + nums[i]
		}
	}
	return result
}
