package medium

import (
	"strconv"
	"strings"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func performArithmetic(a int, b int, operation string) int {
	switch operation {
	case "+":
		return a + b
	case "-":
		return a - b
	case "/":
		return a / b
	case "*":
		return a * b
	default:
		return a + b
	}
}

func isOperator(s string) bool {
	return len(s) == 1 && strings.Contains("+-*/", s)
}
func ReversePolishNotation(tokens []string) int {

	stack := []int{}
	for _, token := range tokens {
		if isOperator(token) {
			updated, rhs := core.ArrayPop(stack)
			stack = updated
			updated, lhs := core.ArrayPop(stack)
			stack = updated
			stack = append(stack, performArithmetic(lhs, rhs, token))
		} else {
			n, err := strconv.Atoi(token)
			if err == nil {
				stack = append(stack, n)
			}
		}
	}
	_, last := core.ArrayPop(stack)
	return last
}
