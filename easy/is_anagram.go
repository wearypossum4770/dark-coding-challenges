package easy

func IsAnagram(s string, t string) bool {
	if len(s) != len(t) {
		return false
	}
	freq := make(map[rune]int)
	for _, v := range s {
		freq[v]++
	}

	for _, ch := range t {
		if freq[ch] == 0 {
			return false
		}
		freq[ch]--
	}
	return true
}
