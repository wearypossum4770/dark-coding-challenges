package easy

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func MajorityElement(nums []int) int {
	half := len(nums) / 2
	counter := core.Counter(nums)

	for k, v := range counter {
		if v > half {
			return k
		}
	}
	return 0
}
