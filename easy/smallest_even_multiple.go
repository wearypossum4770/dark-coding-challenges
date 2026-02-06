package easy

func SmallestEvenMultiple(n int) int {
	if n%2 != 0 {
		return n * 2
	}
	return n
}
