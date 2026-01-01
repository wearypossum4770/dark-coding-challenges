package easy

import (
	"maps"
	"math"
)

func ThirdMax(nums []int) int {
	unique := make(map[int]bool)
	for _, n := range nums {
		unique[n] = true
	}
	first, second, third := math.MinInt, math.MinInt, math.MinInt
	for n := range maps.Keys(unique) {
		switch {
		case n > first:
			third = second
			second = first
			first = n
		case n > second:
			third = second
			second = n
		case n > third:
			third = n
		}
	}
	if len(unique) < 3 {
		return first
	}
	return third
}
