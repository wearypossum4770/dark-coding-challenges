package easy

import (
	"reflect"
	"testing"
)

func TestFizzBuzz(t *testing.T) {
	cases := []struct {
		candidate int
		expected  []string
	}{
		{5, []string{"1", "2", "Fizz", "4", "Buzz"}},
		{3, []string{"1", "2", "Fizz"}},
		{16, []string{"1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16"}},
		{15, []string{"1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"}},
		{35, []string{"1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz", "31", "32", "Fizz", "34", "Buzz"}},
	}
	for _, c := range cases {
		t.Run("Give any array of string representing as fizzbuzz", func(t *testing.T) {
			t.Parallel()
			result := FizzBuzz(c.candidate)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("FizzBuzz(%d) == %v, expected %v", c.candidate, result, c.expected)
			}

		})

	}
}
