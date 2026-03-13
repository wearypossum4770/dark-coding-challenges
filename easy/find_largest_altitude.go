package easy

import "slices"

func FindLargestAltitude(gain []int) int {
	altitude := 0

	result := make([]int, len(gain)+1)
	for i := range gain {
		result[i] = altitude + gain[i]
		altitude += gain[i]
	}
	return slices.Max(result)
}
