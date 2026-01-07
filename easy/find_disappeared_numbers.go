package easy

import "math"

func FindDisappearedNumbers(nums []int) []int {
	result := []int{}
	for i := range nums {
		index := int(math.Abs(float64(nums[i]))) - 1
		if nums[index] > 0 {
			nums[index] = -nums[index]
		}

	}
	for i := range nums {
		if nums[i] > 0 {
			result = append(result, i+1)
		}
	}
	return result
}
