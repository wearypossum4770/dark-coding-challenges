package easy

import (
	"sort"
)

func FindContentChildren(children []int, cookies []int) int {
	i := 0
	j := 0
	sort.Ints(children)
	sort.Ints(cookies)
	for i < len(children) && j < len(cookies) {
		if cookies[j] >= children[i] {
			i += 1
		}
		j += 1
	}
	return i
}
