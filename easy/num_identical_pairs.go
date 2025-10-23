package easy

func NumIdenticalPairs(nums []int) int {
	count := 0
	left := 0
	for left < len(nums) {
		right := left + 1
		for right < len(nums) {
			if nums[left] == nums[right] {
				count++
			}
			right++
		}
		left++
	}
	return count
}
