func uglyNumber(_ n: Int)-> Bool {
	if n <= 0 { return false }
	var primes = [2,3,5]
	var num = n
	for prime in primes {
		while num % prime == 0 {
			num/=prime
		}
		
	}
	return num == 1
}