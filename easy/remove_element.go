package easy

func RemoveElement(nums []int, val int) int {
	result := 0
	for _, num := range nums {
		if num != val {
			nums[result] = num
			result++
		}
	}
	return result
}
