func middleLinkedListNode<T>(_ head: ListNode<T>?) -> ListNode<T>? {

  var slow = head
  var fast = head
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
  }
  return slow
}
