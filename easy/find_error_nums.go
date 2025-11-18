package easy

func FindErrorNums(nums []int) []int {
	result := make([]int, len(nums))
	target := []int{0, 0}
	for _, num := range nums {
		if result[num-1] > 0 {
			target[0] = num
		} else {
			result[num-1] = num
		}
	}
	for i, num := range result {
		if num == 0 {
			target[1] = i + 1
			return target
		}
	}
	return target
}
