package easy

import "strconv"

func IntToFizzBuzz(n int) string {
	if n%15 == 0 {
		return "FizzBuzz"
	}
	if n%5 == 0 {
		return "Buzz"
	}
	if n%3 == 0 {
		return "Fizz"
	}
	return strconv.Itoa(n)
}
func FizzBuzz(n int) []string {
	result := make([]string, n)
	for i := range n {
		result[i] = IntToFizzBuzz(i + 1)
	}
	return result
}
