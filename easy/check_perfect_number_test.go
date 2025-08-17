package easy

import (
	"testing"
)

func TestCheckPerfectNumber(t *testing.T) {
	cases := []struct {
		criteria string
		num      int
		expected bool
	}{
		{"Perfect number 496", 496, true},
		{"Perfect number 8_128", 8128, true},
		{"Perfect number 8_589_869_056", 8589869056, true},
		{"Perfect number 137_438_691_328", 137438691328, true},
		{"Smallest perfect number", 6, true},
		{"Medium perfect number", 28, true},
		{"Large perfect number", 33550336, true},
		{"Smallest abundant number", 12, false},
		{"Medium abundant number", 30, false},
		{"Large abundant number", 33550335, false},
		{"Smallest prime deficient number", 2, false},
		{"Smallest non-prime deficient number", 4, false},
		{"Medium deficient number", 32, false},
		{"Large deficient number", 33550337, false},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := CheckPerfectNumber(c.num)
			if result != c.expected {
				t.Errorf("\n\tGiven: The criteria %v. \nt\tThen: CheckPerfectNumber(%d) == %v, expected %v", c.criteria, c.num, result, c.expected)
			}

		})

	}
}

func TestCalculatePerfectNumber(t *testing.T) {
	cases := []struct {
		num      int
		expected int
	}{
		{496, 496},
		{8128, 8128},
		{8589869056, 8589869056},
		{137438691328, 137438691328},
		{6, 6},
		{28, 28},
		{33550336, 33550336},
		{12, 16},
		{30, 42},
		{33550335, 39885825},
		{2, 1},
		{4, 3},
		{32, 31},
		{33550337, 1},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := CalculatePerfectNumber(c.num)
			if result != c.expected {
				t.Errorf("\n\tGiven: A number %d\n\tAnd: CalculatePerfectNumber(%d).\n\tThen: its value will be %d", c.num, c.num, c.expected)
			}
		})
	}
}

func TestClassifyPerfectNumber(t *testing.T) {
	cases := []struct {
		expected string
		num      int
	}{
		{"perfect", 496},
		{"perfect", 8128},
		{"perfect", 8589869056},
		{"perfect", 137438691328},
		{"perfect", 6},
		{"perfect", 28},
		{"perfect", 33550336},
		{"abundant", 12},
		{"abundant", 30},
		{"abundant", 33550335},
		{"deficient", 2},
		{"deficient", 4},
		{"deficient", 32},
		{"deficient", 33550337},
	}

	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := ClassifyPerfectNumber(c.num)
			if result != c.expected {
				t.Errorf("\n\tGiven: A number %d\n\tAnd: ClassifyPerfectNumber(%d).\n\tThen: its value will be %v", c.num, c.num, c.expected)
			}
		})
	}
}
