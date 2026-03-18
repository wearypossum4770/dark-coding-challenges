package easy

func process(text string) string {
	var result []byte
	for i := 0; i < len(text); i++ {
		if text[i] == '#' {
			if len(result) > 0 {
				result = result[:len(result)-1]
			}
		} else {
			result = append(result, text[i])
		}
	}
	return string(result)
}
func BackspaceCompare(s, t string) bool {
	return process(s) == process(t)
}
