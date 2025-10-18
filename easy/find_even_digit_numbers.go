package easy

import "strconv"

func FindEvenDigitNumbers(nums []int) int {
	result := 0
	for _, num := range nums {
		if len(strconv.Itoa(num))%2 == 0 {
			result++
		}
	}
	return result
}
