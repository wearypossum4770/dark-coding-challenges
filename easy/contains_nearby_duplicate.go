package easy

func ContainsNearbyDuplicate(nums []int, k int) bool {
	seen := make(map[int]int)
	for i, num := range nums {
		if index, exists := seen[num]; exists {
			if i-index <= k {
				return true
			}
		}
		seen[num] = i
	}
	return false
}
