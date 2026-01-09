package medium

func RemoveDuplicateLetters(s string) string {
	last := make(map[rune]int)
	seen := make(map[rune]bool)
	stack := make([]rune, 0, len(s))

	for i, char := range s {
		last[char] = i
	}

	for i, char := range s {
		if seen[char] {
			continue
		}

		for len(stack) > 0 {
			top := stack[len(stack)-1]
			if top > char && last[top] > i {
				stack = stack[:len(stack)-1]
				delete(seen, top) // ✅ correct
			} else {
				break
			}
		}

		stack = append(stack, char)
		seen[char] = true
	}

	return string(stack)
}
