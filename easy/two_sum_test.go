package easy

import (
	"reflect"
	"testing"
)

var twoSumCases = []struct {
	criteria   string
	target     int
	inputArray []int
	expected   []int
}{
	{"two sum with integers", 9, []int{2, 7, 11, 15}, []int{0, 1}},
	{"two sum simple increasing sequence", 9, []int{2, 7, 11, 15}, []int{0, 1}},
	{"two sum unordered elements", 6, []int{3, 2, 4}, []int{1, 2}},
	{"two sum duplicate values", 6, []int{3, 3}, []int{0, 1}},
	{"two sum mirrored elements", 6, []int{3, 2, 3}, []int{0, 2}},
	{"two sum inner duplicates", 10, []int{2, 5, 5, 11}, []int{1, 2}},
	{"two sum outer duplicates", 0, []int{0, 4, 3, 0}, []int{0, 3}},
	{"two sum crossing zero", 0, []int{-3, 4, 3, 90}, []int{0, 2}},
	{"two sum descending negatives", -8, []int{-1, -2, -3, -4, -5}, []int{2, 4}},
	{"two sum large numbers", 100, []int{5, 75, 25}, []int{1, 2}},
	{"two sum identical large numbers", 4444444, []int{2222222, 2222222}, []int{0, 1}},
	{"two sum sparse high values", 18431, []int{1, 6142, 8192, 10239}, []int{2, 3}},
	{"two sum mixed negatives", -19, []int{-10, -1, -18, -19}, []int{1, 2}},
	{"two sum mixed positive and negative", 9, []int{-10, 7, 19, 15}, []int{0, 2}},
	{"two sum boundary negatives", -1, []int{0, 3, -3, 4, -1}, []int{0, 4}},
	{"two sum sparse negatives and positives", -6, []int{-18, 12, 3, 0}, []int{0, 1}},
	{"two sum mixed order small positives", 6, []int{1, 3, 4, 2}, []int{2, 3}},
	// this cases is an impossible case included to ensure loop exits.
	{"two sum invalid test case", 0, []int{3, 3}, []int{}},
}

func TestTwoSum(t *testing.T) {
	for _, c := range twoSumCases {
		t.Run(c.criteria, func(t *testing.T) {
			t.Parallel()
			result := TwoSum(c.inputArray, c.target)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("twoSum(%v, %d) == %v, expected %v", c.inputArray, c.target, result, c.expected)
			}
		})
	}
}
