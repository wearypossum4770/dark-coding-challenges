package easy

func LongestPalindrome(s string) int {
	freq := map[rune]int{}
	for _, char := range s {
		freq[char] += 1
	}
	odds := -1
	for _, value := range freq {
		if value%2 == 1 {
			odds++
		}
	}
	if odds > 0 {
		return len(s) - odds
	}
	return len(s)
}
