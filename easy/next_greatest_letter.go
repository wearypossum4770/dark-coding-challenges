package easy

func NextGreatestLetter(letters []byte, target byte) byte {
	for _, char := range letters {
		if target < char {
			return char
		}
	}
	return letters[0]
}
