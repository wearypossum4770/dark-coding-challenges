package medium

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func MinSubArray(nums []int, p int) int {
	total := core.ArrayReduce(nums) % p
	if total == 0 {
		return total
	}

	result := len(nums)
	prefix := 0
	seen := map[int]int{0: -1}
	for i, num := range nums {
		prefix = (prefix + num) % p
		if lookup, exists := seen[(prefix-total+p)%p]; exists {
			result = min(result, i-lookup)
		}
		seen[prefix] = i
	}

	if result == len(nums) {
		return -1
	}
	return result
}
