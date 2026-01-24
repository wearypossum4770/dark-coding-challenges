package easy

func MiddleLinkedListNode[T ComparableOrdered](head *ImprovedListNode[T]) *ImprovedListNode[T] {
	if head == nil {
		return nil
	}
	slow := head
	fast := head
	for fast != nil && fast.Next != nil {
		slow = slow.Next
		fast = fast.Next.Next
	}
	return slow
}
