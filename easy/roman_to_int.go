package easy

func getValueWithDefault(m map[byte]int, k byte, v int) int {
	if value, ok := m[k]; ok {
		return value
	}
	return v
}

func RomanToInt(romanNumber string) int {
	romanNumerals := map[byte]int{'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
	total := 0
	index := 0
	for index < len(romanNumber)-1 {
		next := getValueWithDefault(romanNumerals, romanNumber[index+1], 0)
		current := getValueWithDefault(romanNumerals, romanNumber[index], 0)
		if current < next {
			total -= current
		} else {
			total += current
		}
		index += 1
	}
	return total + getValueWithDefault(romanNumerals, romanNumber[index], 0)
}
