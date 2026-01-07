package easy

import (
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func MissingNumber(nums []int) int {
	expected := len(nums) * (len(nums) + 1) / 2
	actual := dark_coding_challenges.ArrayReduce(nums)
	return expected - actual
}
