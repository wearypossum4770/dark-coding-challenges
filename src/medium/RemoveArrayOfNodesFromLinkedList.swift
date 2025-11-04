import easy

func removeArrayOfNodesFromLinkedList(_ nums: [Int], _ head: easy.ListNode<Int>?) -> easy.ListNode<
  Int
>? {
  let unique = Set(nums)
  let dummy: easy.ListNode<Int> = easy.ListNode<Int>(0)
  dummy.next = head
  var current = dummy
  while let node = current.next {
    if let val = node.val, unique.contains(val) {
      current.next = node.next
    } else {
      current = node
    }
  }
  return dummy.next
}
