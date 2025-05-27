package easy

func ReverseLinkedList[T ComparableOrdered](head *ImprovedListNode[T]) *ImprovedListNode[T] {
	current := head
	var previous *ImprovedListNode[T]
	var next *ImprovedListNode[T]

	for current != nil {
		next = current.Next
		current.Next = previous
		previous = current
		current = next
	}
	return previous
}
