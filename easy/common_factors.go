package easy

func CommonFactors(a int, b int) int {
	count := 0
	m := max(a, b)
	for i := 1; i < m+1; i++ {
		if a%i == 0 && b%i == 0 {
			count++
		}
	}
	return count
}
