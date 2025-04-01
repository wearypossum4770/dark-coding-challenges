package medium

import (
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	"strings"
)

func CanBePrepared(recipe string, ingredients []byte) bool {
	if len(recipe) == 0 || len(ingredients) == 0 {
		return false
	}

	outer, inner, set := []bool{}, []byte{}, dark_coding_challenges.CreateSetLike(ingredients)

	recipe = strings.ReplaceAll(recipe, " ", "")
	for i := 0; i < len(recipe); i++ {
		if dark_coding_challenges.IsAlpha(recipe[i]) {
			inner = append(inner, recipe[i])
			continue
		}
		switch recipe[i] {
		case '|', '(':
			outer = append(outer, dark_coding_challenges.AllTrue(dark_coding_challenges.SetContains(set, inner)))
			inner = inner[:0]
		default:
			continue
		}
	}
	if len(inner) > 0 {
		outer = append(outer, dark_coding_challenges.AllTrue(dark_coding_challenges.SetContains(set, inner)))
	}
	return dark_coding_challenges.AnyTrue(outer)
}
