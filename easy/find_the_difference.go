package easy

import (
	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func FindTheDifference(s string, t string) byte {
	counts := core.CharacterFrequency(s)
	for _, char := range t {
		counts[char]--
		if counts[char] < 0 {
			return byte(char)
		}
	}
	return ' '
}
