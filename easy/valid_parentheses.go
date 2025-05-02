package easy

func ValidParentheses(s string) bool {
	stack := make([]byte, 0, len(s))
	brackets := map[byte]byte{
		'(': ')',
		'{': '}',
		'[': ']',
	}
	for i := 0; i < len(s); i++ {
		if closing, ok := brackets[s[i]]; ok {
			stack = append(stack, closing)
		} else {
			if len(stack) == 0 || stack[len(stack)-1] != s[i] {
				return false
			}
			stack = stack[:len(stack)-1]
		}
	}
	return len(stack) == 0
}
