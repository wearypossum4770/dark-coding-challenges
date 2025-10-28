package easy

func FindFirstPalindrome(words []string) string {
	for _, word := range words {
		if IsPalindrome(word) {
			return word
		}
	}
	return ""
}
