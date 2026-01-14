package medium

func SortArray(nums []int) []int {
	if len(nums) == 0 {
		return nums
	}
	freq := make(map[int]int)
	result := make([]int, len(nums))
	index, max, min := 0, nums[0], nums[0]
	for _, num := range nums {
		freq[num]++
		if max < num {
			max = num
		}
		if min > num {
			min = num
		}
	}
	for i := min; i <= max; i++ {
		count := freq[i]
		for count > 0 {
			result[index] = i
			count--
			index++
		}
	}
	return result
}
