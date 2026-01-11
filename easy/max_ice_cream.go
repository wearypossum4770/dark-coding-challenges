package easy

import "slices"

func MaxIceCream(costs []int, coins int) int {
	cones := 0
	slices.Sort(costs)
	for _, cost := range costs {
		if cost <= coins {
			coins -= cost
			cones++
		}
	}
	return cones
}
