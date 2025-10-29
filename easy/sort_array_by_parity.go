package easy

func SortArrayByParity(nums []int) []int {
	left, right := 0, len(nums)-1
	for left < right {
		if nums[left]%2 == 0 {
			left++
		} else if nums[right]%2 == 1 {
			right--
		} else {
			nums[right], nums[left] = nums[left], nums[right]
			left++
			right--
		}
	}
	return nums
}
