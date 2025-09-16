package easy

import (
	"reflect"
	"testing"
)

func TestRunningArraySum(t *testing.T) {
	cases := []struct {
		criteria string
		nums     []int
		expected []int
	}{
		{"✅ Normal case", []int{1, 2, 3, 4}, []int{1, 3, 6, 10}},
		{"✅ All 1s", []int{1, 1, 1, 1, 1}, []int{1, 2, 3, 4, 5}},
		{"✅ Mixed values", []int{3, 1, 2, 10, 1}, []int{3, 4, 6, 16, 17}},
		{"🟢 Empty array", []int{}, []int{}},
		{"🟢 Single element", []int{5}, []int{5}},
		{"🟢 Negative numbers", []int{-1, -2, -3}, []int{-1, -3, -6}},
		{"🟢 Alternating positives & negatives", []int{1, -1, 1, -1, 1}, []int{1, 0, 1, 0, 1}},
	}
	for _, c := range cases {
		t.Run(c.criteria, func(t *testing.T) {
			result := RunningArraySum(c.nums)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("RunningArraySum(%v) == %v, expected %v", c.nums, result, c.expected)
			}

		})

	}
}
