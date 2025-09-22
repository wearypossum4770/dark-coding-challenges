package easy

func ArrayContainsDuplicate(nums []int) bool {
	seen := make(map[int]bool)
	for _, n := range nums {
		if _, ok := seen[n]; ok {
			return true
		}
		seen[n] = true
	}
	return false
}
