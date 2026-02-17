package easy

func ContainsDuplicate(nums []int) bool {
	set := make(map[int]struct{})
	for n := range nums {
		if _, ok := set[n]; ok {
			return true
		}
		set[n] = struct{}{}
	}
	return false
}
