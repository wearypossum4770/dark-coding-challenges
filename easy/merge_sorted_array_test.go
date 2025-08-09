package easy

import (
	"reflect"
	"testing"
)

func TestMergeSortedArray(t *testing.T) {
	cases := []struct {
		first      []int
		firstSize  int
		second     []int
		secondSize int
		expected   []int
	}{
		{[]int{1, 2, 3, 0, 0, 0}, 3, []int{2, 5, 6}, 3, []int{1, 2, 2, 3, 5, 6}},
		{[]int{1}, 1, []int{}, 0, []int{1}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			result := MergeSortedArray(c.first, c.firstSize, c.second, c.secondSize)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("MergeSortedArray(%v, %d, %v, %d) == %v, expected %v", c.first, c.firstSize, c.second, c.secondSize, result, c.expected)
			}

		})

	}
}

func TestMergeSortedArrayInPlace(t *testing.T) {
	cases := []struct {
		first      []int
		firstSize  int
		second     []int
		secondSize int
		expected   []int
	}{
		{[]int{1, 2, 3, 0, 0, 0}, 3, []int{2, 5, 6}, 3, []int{1, 2, 2, 3, 5, 6}},
		{[]int{1}, 1, []int{}, 0, []int{1}},
	}
	for _, c := range cases {
		cache := c.first
		t.Run("", func(t *testing.T) {
			MergeSortedArrayInPlace(c.first, c.firstSize, c.second, c.secondSize)
			if !reflect.DeepEqual(c.first, c.expected) {
				t.Errorf("MergeSortedArrayInPlace(%v, %d, %v, %d), received: %v expected %v", cache, c.firstSize, c.second, c.secondSize, c.first, c.expected)
			}

		})

	}
}
