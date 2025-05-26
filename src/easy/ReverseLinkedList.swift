func reverseLinkedList<T: Equatable>(_ head: ListNode<T>?) -> ListNode<T>? {
  var previous: ListNode<T>? = nil
  var next: ListNode<T>? = nil
  var current: ListNode<T>? = head
  while current != nil {
    next = current?.next
    current?.next = previous
    previous = current
    current = next
  }
  return previous
}
