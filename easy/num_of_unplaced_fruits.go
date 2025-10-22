package easy

func NumOfUnplacedFruits(fruits, baskets []int) int {
	count := len(fruits)
	replaced := make([]bool, len(baskets))
	for _, fruit := range fruits {
		for right, basket := range baskets {
			if basket >= fruit && !replaced[right] {
				replaced[right] = true
				count--
				break
			}
		}
	}

	return count
}
