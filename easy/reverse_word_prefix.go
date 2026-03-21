package easy

func ReverseWordPrefix(word string, char byte) string {
	index := 0
	for i := range word {
		if word[i] == char {
			result := make([]byte, len(word))
			position := 0
			left, right := i, i+1
			for left >= 0 {
				result[position] = word[left]
				left--
				position++
			}
			for right < len(word) {
				result[position] = word[right]
				right++
				position++
			}
			return string(result)
		}
		index++
	}
	return word
}
