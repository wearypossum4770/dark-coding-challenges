package medium

func ReverseInteger(x int) int {
	num := int64(0)

	for x != 0 {
		num = num*10 + int64(x%10)
		x /= 10
	}
	if num > 1<<31-1 || num < -1<<31 {
		return 0
	}

	return int(num)
}
