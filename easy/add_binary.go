package easy

import (
	"strings"
)

func AddBinary(a string, b string) string {
	i := len(a) - 1
	j := len(b) - 1
	carry := 0
	res := make([]string, max(len(a), len(b))+1)
	k := len(res) - 1

	for i >= 0 || j >= 0 || carry > 0 {
		sum := carry
		if i >= 0 {
			sum += int(a[i] - '0')
			i--
		}
		if j >= 0 {
			sum += int(b[j] - '0')
			j--
		}
		res[k] = string('0' + rune(sum%2))
		k--
		carry = sum / 2
	}
	return strings.Join(res, "")
}
