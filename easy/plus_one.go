package easy

func PlusOne(digits []int) []int {
	result := make([]int, len(digits))

	copy(result, digits)
	remainder := 1
	for index := len(result) - 1; index >= 0; index-- {
		sum := result[index] + remainder
		if sum <= 9 {
			result[index] = sum
			return result
		}
		result[index] = 0
		remainder = 1
	}
	if remainder > 0 {
		c := make([]int, len(digits)+1)
		c[0] = 1
		copy(c[1:], result)
		return c
	}
	return result
}
