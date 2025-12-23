package easy

func IsUpperCase(char rune) bool {
	return char >= 65 && char <= 90
}
func IsLowerCase(char rune) bool {
	return char >= 97 && char <= 122
}
func DetectCapitalUse(word string) bool {
	count := len(word)
	lowerCase := 1
	upperCase := 1
	if IsUpperCase(rune(word[0])) {
		for _, ch := range word[1:] {
			if IsLowerCase(ch) {
				lowerCase++
			} else if IsUpperCase(ch) {
				upperCase++
			}
		}
		if count == lowerCase || count == upperCase {
			return true
		}
	}
	for _, ch := range word {
		if IsUpperCase(ch) {
			return false
		}
	}
	return true
}
