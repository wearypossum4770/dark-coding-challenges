package medium

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	"strings"
)

func CanBePrepared(recipe string, ingredients []byte) bool {
	if len(recipe) == 0 || len(ingredients) == 0 {
		return false
	}

	outer, inner, set := []bool{}, []byte{}, core.CreateSetLike(ingredients)

	recipe = strings.ReplaceAll(recipe, " ", "")
	for i := range recipe {
		char := recipe[i]
		if core.IsAlpha(char) {
			inner = append(inner, char)
			continue
		}
		switch char {
		case '|', '(':
			outer = append(outer, core.AllTrue(core.SetContains(set, inner)))
			inner = inner[:0]
		}
	}
	if len(inner) > 0 {
		outer = append(outer, core.AllTrue(core.SetContains(set, inner)))
	}
	return core.AnyTrue(outer)
}
