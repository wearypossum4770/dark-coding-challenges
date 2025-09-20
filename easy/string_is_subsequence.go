package easy

func StringIsSubsequence(s string, t string) bool {
	left := 0
	right := 0
	for left < len(s) && right < len(t) {
		if s[left] == t[right] {
			left++
		}
		right++
	}

	return left == len(s)
}
