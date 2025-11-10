package easy

func LongestCommonPrefix(strs []string) string {
	if len(strs) == 0 {
		return ""
	}
	for i := range len(strs[0]) {
		for _, word := range strs[1:] {
			if i >= len(word) || word[i] != strs[0][i] {
				return strs[0][:i]
			}
		}
	}
	return strs[0]
}
