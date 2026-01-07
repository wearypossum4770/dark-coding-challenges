package medium

func FindDuplicateNumber(nums []int) int {
	result := make([]int, len(nums))
	for _, i := range nums {
		if result[i-1] > 0 {
			return i
		}
		result[i-1] += 1
	}
	return 0
}
