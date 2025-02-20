package easy

import (
	"fmt"
	"testing"
)

// TestIsPalindrome tests the IsPalindrome function.
func TestPalindromeNumber(t *testing.T) {
	cases := []struct {
		number   int
		expected bool
	}{
		{1000021, false},
		{1611881161, true},
		{-121, false},
        {121, true},
        {10, false},
        {-101, false},
        {-10, false},
        {-1, false},
        {3, true},
        {8, true},
        {9, true},
        {11, true},
        {100, false},
        {-101, false},
        {1, true},
        {123, false},
        {313, true},
        {1000030001, false},
        {838, true},
        {77, true},
        {95159, true},
        {839, false},
        {4234, false},
        {13, false},
	}
	for _, c := range cases {
		t.Run(fmt.Sprintf("A number %d passes palindrome test: %t", c.number, c.expected), func(t *testing.T) {
			t.Parallel()
			result := PalindromeNumber(c.number)
			if result != c.expected {
				t.Errorf("PalindromeNumber(%v) = %v; expected %v", c.number, result, c.expected)
			}
		})
	}
}
