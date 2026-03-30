import helpers

func hasCycle<T>(_ head: ListNode<T>?) -> Bool {
  var fast = head
  var slow = head
  while fast != nil && fast?.next != nil {
    fast = fast?.next?.next
    slow = slow?.next
    if fast === slow {
      return true
    }
  }

  return false
}
