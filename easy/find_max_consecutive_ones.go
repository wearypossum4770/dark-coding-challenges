package easy

import (
	"math"
)

func FindMaxConsecutiveOnes(nums []int) int {
	count := 0
	m := 0
	for i := 0; i < len(nums); i++ {
		if m < count {
			m = count
		}
		if nums[i] == 1 {
			count++
		} else {
			count = 0
		}
	}
	return int(math.Max(float64(m), float64(count)))
}
