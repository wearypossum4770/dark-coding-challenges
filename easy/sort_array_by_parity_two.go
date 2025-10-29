package easy

func SortArrayByParityTwo(nums []int) []int {
	result := make([]int, len(nums))
	even, odd := 0, 1
	for _, n := range nums {
		if n%2 == 0 {
			result[even] = n
			even += 2
		} else {
			result[odd] = n
			odd += 2
		}
	}

	return result
}
