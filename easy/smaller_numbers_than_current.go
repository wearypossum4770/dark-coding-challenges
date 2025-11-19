package easy

func SmallerNumbersThanCurrent(nums []int) []int {
	result := make([]int, len(nums))
	for i := range nums {
		for j := range nums {
			if nums[i] > nums[j] {
				result[i]++
			}
		}
	}
	return result
}
