package easy

func GetArrayConcatenation(nums []int) []int {
	result := make([]int, 2*len(nums))
	for i, num := range nums {
		result[i] = num
		result[i+len(nums)] = num
	}

	return result
}
