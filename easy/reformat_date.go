package easy

import (
	"fmt"
	"slices"
	"strings"
)

func ReformatDate(date string) string {

	months := []string{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
	parts := strings.Split(date, " ")
	day := 0
	month := slices.Index(months, parts[1])
	year := parts[2]
	for _, i := range parts[0] {
		if i-'0' < 10 {
			day = day*10 + int(i-'0')
		}
	}
	return fmt.Sprintf("%s-%02d-%02d", year, month+1, day)
}
