package easy

func UglyNumber(n int) bool {
	primes := []int{2, 3, 5}
	if n < 1 {
		return false
	}
	for _, prime := range primes {

		for n%prime == 0 {
			n /= prime
		}
	}
	return n == 1
}
