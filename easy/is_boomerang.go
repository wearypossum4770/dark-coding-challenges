package easy

import (
	"fmt"
)

func IsBoomerang(points [][]int) bool {
	distinct := make(map[string]bool)
	for _, value := range points {
		key := fmt.Sprintf("%d,%d", value[0], value[1])
		if distinct[key] {
			return false
		}
		distinct[key] = true
	}
	if len(distinct) != 3 {
		return false
	}
	x1, y1 := points[0][0], points[0][1]
	x2, y2 := points[1][0], points[1][1]
	x3, y3 := points[2][0], points[2][1]
	return (x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)) != 0

}
