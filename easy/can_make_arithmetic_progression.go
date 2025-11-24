package easy

import "slices"

func CanMakeArithmeticProgression(arr []int) bool {
	slices.Sort(arr)
	distance := arr[0] - arr[1]
	index := 0
	for index < len(arr)-1 {
		if distance != arr[index]-arr[index+1] {
			return false
		}
		index++
	}
	return true
}
