package easy

import (
	"math"
)

func CheckPerfectNumber(n int) bool {
	return n == CalculatePerfectNumber(n)
}
func ClassifyPerfectNumber(n int) string {
	num := CalculatePerfectNumber(n)
	if n < num {
		return "abundant"
	}
	if n > num {
		return "deficient"
	}
	return "perfect"
}
func CalculatePerfectNumber(n int) int {
	if n <= 1 {
		return 0
	}
	total := 1

	root := int(math.Sqrt(float64(n)))

	for i := 2; i <= root; i++ {
		if n%i == 0 {
			total += i
			other := n / i
			if other != i {
				total += other
			}
		}
	}
	return total
}
