package easy

// Runtime 0.18388 seconds
// Memory  2 KiB
import (
	"github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	"math"
)

func ArmstrongNumbers(numberToCheck int) int {
	if numberToCheck < 0 {
		return 0
	}
	total := 0
	digits := dark_coding_challenges.IntToDigits(numberToCheck)
	size := len(digits)
	for _, num := range digits {
		total += int(math.Pow(float64(num), float64(size)))
	}
	if total == numberToCheck {
		return 1
	}
	return 0
}
