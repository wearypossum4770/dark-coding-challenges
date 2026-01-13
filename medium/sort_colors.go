package medium

func SortColors(nums []int) {
	freq := make(map[int]int)
	for _, num := range nums {
		freq[num]++
	}
	index := 0
	for i := range 3 {
		count := freq[i]
		for count > 0 {
			count--
			nums[index] = i
			index++
		}
	}
}
