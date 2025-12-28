package medium

import (
	"slices"
	"strings"
	"unicode"
)

func maskEmail(s string, buffer *strings.Builder) string {
	domain := strings.Index(s, "@")
	for i, char := range s {
		if i == 0 {
			buffer.WriteRune(char)
			buffer.WriteString("*****")
		} else if i == domain-1 || i >= domain {
			buffer.WriteRune(char)
		}
	}
	return buffer.String()
}
func maskPhone(s string, buffer *strings.Builder) int {
	count := 0
	chars := 0
	for i := len(s) - 1; i >= 0; i-- {
		if !unicode.IsDigit(rune(s[i])) {
			continue
		}
		if count == 4 || count == 8 || count == 12 {
			buffer.WriteByte('-')
			buffer.WriteByte('*')
			chars++
			count += 2
			continue
		}
		if count < 4 {
			chars++
			buffer.WriteByte(s[i])
		} else {
			chars++
			buffer.WriteByte('*')
		}
		count++
	}
	return (chars)
}
func MaskingPersonallyIdentifiableInformation(s string) string {
	buffer := strings.Builder{}
	word := strings.ToLower(s)
	if strings.Index(s, "@") > -1 {
		maskEmail(word, &buffer)
	} else {
		chars := maskPhone(word, &buffer)

		arr := strings.Split(buffer.String(), "")
		if chars > 10 {
			arr = append(arr, "+")
		}
		slices.Reverse(arr)
		return strings.Join(arr, "")
	}
	return buffer.String()
}
