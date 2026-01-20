package easy

import (
	"reflect"
	"testing"

	core "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges"
	ds "github.com/wearypossum4770/dark-coding-challenges/dark_coding_challenges/data_structures"
)

func TestPreOrderTraversal(t *testing.T) {
	cases := []struct {
		nums     []*int
		expected []int
	}{
		{[]*int{}, []int{}},
		{[]*int{core.IntPtr(1)}, []int{1}},
		{[]*int{core.IntPtr(1), nil}, []int{1}},
		{[]*int{core.IntPtr(1), nil, nil}, []int{1}},
		{[]*int{core.IntPtr(1), core.IntPtr(2)}, []int{1, 2}},
		{[]*int{core.IntPtr(1), nil, core.IntPtr(2)}, []int{1, 2}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), nil}, []int{1, 2}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), nil, core.IntPtr(3)}, []int{1, 2, 3}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), core.IntPtr(3)}, []int{1, 2, 3}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), core.IntPtr(3), nil, nil, nil, core.IntPtr(4)}, []int{1, 2, 3, 4}},
		{[]*int{core.IntPtr(1), nil, core.IntPtr(2), nil, core.IntPtr(3), nil, core.IntPtr(4)}, []int{1, 2, 3, 4}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), nil, core.IntPtr(3), nil, core.IntPtr(4)}, []int{1, 2, 3, 4}},

		{[]*int{core.IntPtr(1), core.IntPtr(2), core.IntPtr(3), core.IntPtr(4), core.IntPtr(5), core.IntPtr(6), core.IntPtr(7)}, []int{1, 2, 4, 5, 3, 6, 7}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), core.IntPtr(3), nil, core.IntPtr(4), nil, core.IntPtr(5)}, []int{1, 2, 4, 3, 5}},
		{[]*int{core.IntPtr(1), nil, core.IntPtr(2), core.IntPtr(3), core.IntPtr(4), nil, nil, nil, core.IntPtr(5)}, []int{1, 2, 3, 4, 5}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), nil, nil, core.IntPtr(3), nil, core.IntPtr(4), nil, core.IntPtr(5)}, []int{1, 2, 3, 4, 5}},
		{[]*int{core.IntPtr(1), core.IntPtr(2), core.IntPtr(3), core.IntPtr(4), nil, nil, nil, core.IntPtr(5)}, []int{1, 2, 4, 5, 3}},
		{[]*int{core.IntPtr(1), nil, core.IntPtr(2), core.IntPtr(3), nil, core.IntPtr(4), nil, core.IntPtr(5)}, []int{1, 2, 3, 4, 5}},
	}
	for _, c := range cases {
		t.Run("", func(t *testing.T) {
			root := ds.CreateTreeNode(c.nums)
			result := PreOrderTraversal(root)
			if !reflect.DeepEqual(result, c.expected) {
				t.Errorf("\n\tGiven: a tree %v, PreOrderTraversal(%v) == %v, expected %v", root, c.nums, result, c.expected)
			}
		})
	}
}
