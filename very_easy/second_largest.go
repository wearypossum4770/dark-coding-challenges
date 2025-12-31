package very_easy

import "math"

func SecondLargest(nums []int) int {
	first, second := math.MinInt, math.MinInt
	for _, n := range nums {
		if first < n {
			second = first
			first = n
		}
		if first > n && second < n {
			second = n
		}
	}
	return second
}
