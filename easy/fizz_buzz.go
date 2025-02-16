package easy

import (
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func FizzBuzz(candidate int) []string {
	target := make([]string, candidate)
	for i := 0; i < candidate; i++ {
		target[i] = dark_coding_challenges.IntegerToFizzBuzz(i + 1)
	}
	return target
}
