package easy

func DifferenceOfSums(n, m int) int {
	lhs := 0
	rhs := 0
	for i := 1; i <= n; i++ {
		if i%m == 0 {
			rhs += i
		} else {
			lhs += i
		}
	}
	return lhs - rhs

}
