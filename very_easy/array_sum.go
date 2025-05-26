package very_easy

// Memory 2 KiB
// Runtime 0.02697 seconds
func ArraySum(array []int) int {
	sum := 0
	for _, num := range array {
		sum += num
	}
	return sum
}
