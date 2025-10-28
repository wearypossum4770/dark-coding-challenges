package easy

func IsVowel(r rune) bool {
	switch r {
	case 'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U':
		return true
	default:
		return false
	}
}
func ReverseVowels(s string) string {
	runes := []rune(s)
	left, right := 0, len(runes)-1
	for left < right {
		for left < right && !IsVowel(runes[left]) {
			left++
		}
		for left < right && !IsVowel(runes[right]) {
			right--
		}
		runes[left], runes[right] = runes[right], runes[left]
		left++
		right--
	}
	return string(runes)
}
