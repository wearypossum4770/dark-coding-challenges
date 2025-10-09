package easy

func DistributeCandies(candyType []int) int {
	stop := len(candyType) / 2
	unique := make(map[int]bool)
	for _, candy := range candyType {
		unique[candy] = true
		if len(unique) > stop {
			return stop
		}
	}
	return len(unique)
}
