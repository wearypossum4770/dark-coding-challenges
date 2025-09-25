import easy

func deleteLinkedListNode<T>(_ node: inout ListNode<T>?) {
  guard let current = node, let next = current.next else {
    fatalError("Cannot delete the last node in the list")
  }
  current.val = next.val
  current.next = next.next

}
