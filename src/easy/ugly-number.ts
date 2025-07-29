// https://leetcode.com/problems/ugly-number
export const uglyNumber = (n: number): boolean => {
	if (n <= 0) return false;
	const primes = [2,3,5]
	for(let prime of primes) {
	while(n % prime === 0) {
		n /= prime;
	}
	}
	return n === 1
}
