package easy

func getValueWithDefault(m map[string]int, key string, defaultValue int) int {
	if value, ok := m[key]; ok {
		return value
	}
	return defaultValue
}

func RomanToInt(romanNumber string) int {
	romanNumerals := map[string]int{"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
	total := 0
	index := 0
	for index < len(romanNumber)-1 {
		next := getValueWithDefault(romanNumerals, string(romanNumber[index+1]), 0)
		current := getValueWithDefault(romanNumerals, string(romanNumber[index]), 0)
		if current < next {
			total -= current
		} else {
			total += current
		}
		index += 1
	}
	return total + getValueWithDefault(romanNumerals, string(romanNumber[index]), 0)
}
