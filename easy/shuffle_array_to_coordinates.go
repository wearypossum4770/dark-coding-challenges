package easy

func ShuffleArrayToCoordinates(nums []int, n int) []int {
	result := make([]int, len(nums))
	for i := 0; i < n; i++ {
		result[2*i] = nums[i]
		result[2*i+1] = nums[i+n]
	}
	return result
}
