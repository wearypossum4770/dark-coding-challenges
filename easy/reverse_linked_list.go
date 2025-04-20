package easy

func ReverseLinkedList[T comparable](head *ListNode[T]) *ListNode[T] {
	current := head
	var previous *ListNode[T]
	var next *ListNode[T]

	for current != nil {
		next = current.next
		current.next = previous
		previous = current
		current = next
	}
	return previous
}
