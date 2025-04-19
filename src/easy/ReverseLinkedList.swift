func reverseLinkedList<T: Equatable>(_ head: LinkedListNode<T>?) -> LinkedListNode<T>? {
  var previous: LinkedListNode<T>? = nil
  var next: LinkedListNode<T>? = nil
  var current: LinkedListNode<T>? = head
  while current != nil {
    next = current?.next
    current?.next = previous
    previous = current
    current = next
  }
  return previous
}
