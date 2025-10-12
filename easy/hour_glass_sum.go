package easy

import "math"

func HourGlassSum(matrix [][]int) int {
	if len(matrix) < 3 {
		return 0
	}
	result := math.MinInt
	for i := range len(matrix) - 2 {
		for j := range len(matrix[i]) - 2 {
			sum := matrix[i][j] +
				matrix[i][j+1] +
				matrix[i][j+2] +
				matrix[i+1][j+1] +
				matrix[i+2][j] +
				matrix[i+2][j+1] +
				matrix[i+2][j+2]
			result = max(result, sum)
		}
	}
	return result
}
