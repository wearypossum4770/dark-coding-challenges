package easy

import (
	"reflect"
	"testing"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
)

func TestCreateCounter(t *testing.T) {
	cases := []struct {
		criteria   string
		n          int
		operations []string
		expected   []int
	}{
		{"Example 1: starting at 10 with 3 calls", 10, []string{"call", "call", "call"}, []int{10, 11, 12}},
		{"Example 2: starting at -2 with 5 calls", -2, core.Array("call", 5), []int{-2, -1, 0, 1, 2}},
		{"Edge Case 1: starting at 0 with no calls", 0, []string{}, []int{}},
		{"Edge Case 2: single call from 1000", 1000, []string{"call"}, []int{1000}},
		{"single call from zero", 0, []string{"call"}, []int{0}},
		{"Edge Case 3: starting at -1000 with 3 calls", -1000, []string{"call", "call", "call"}, []int{-1000, -999, -998}},
		{"lower bound near -1_000", -1_000, []string{"call", "call"}, []int{-1_000, -999}},
		{"upp bound near 1_000", 999, []string{"call", "call", "call"}, []int{999, 1_000, 1_001}},
		{"Edge Case 4: 1000 calls starting from 5", 5, core.Array("call", 1000), core.ArrayFromRange(core.Range[int]{Start: 0, Stop: 1_000, Initial: 5})},
		{"mutliple increments (10 calls)", 3, core.Array("call", 10), []int{3, 4, 5, 6, 7, 8, 9, 10, 11, 12}},
		{"stress test (20 increments)", 42, core.Array("call", 20), []int{42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61}},
		{"single call (simple check)", 7, []string{"call"}, []int{7}},
		{"midrange five calls", 100, core.Array("call", 5), []int{100, 101, 102, 103, 104}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			counter := CreateCounter(c.n)
			actual := make([]int, len(c.operations))
			for i, _ := range c.operations {
				CounterCapture(actual, i, counter)
			}
			if !reflect.DeepEqual(actual, c.expected) {
				t.Errorf("CreateCounter(%v) == %v, expected %v", c.n, actual, c.expected)
			}

		})

	}
}
