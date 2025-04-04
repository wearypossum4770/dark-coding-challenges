package easy

func ReverseString(s []rune) {
	if len(s) == 0 {
		return
	}
	left, right := 0, len(s)-1
	var char rune
	for left < right {
		char = s[left]
		s[left] = s[right]
		s[right] = char
		left++
		right--
	}

}
