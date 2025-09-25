package medium

import (
	easy "github.com/wearypossum4770/dark-coding-challenges/easy"
	"golang.org/x/exp/constraints"
)

func DeleteLinkedListNode[T constraints.Ordered](node *easy.ImprovedListNode[T]) {
	node.Val = node.Next.Val
	node.Next = node.Next.Next

}
