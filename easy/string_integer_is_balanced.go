package easy

func StringIntegerIsBalanced(num string) bool {
	even := 0
	odd := 0
	for i, r := range num {
		digit := int(r) - int('0')
		if i%2 == 0 {
			even += digit
		} else {
			odd += digit
		}
	}
	return even == odd
}
