import Testing
import easy

@testable import medium

@Test(arguments: [
  ([4, 5, 1, 9], 5, [4, 1, 9]),
  ([4, 5, 1, 9], 1, [4, 5, 9]),
  ([1, 2, 3, 4], 3, [1, 2, 4]),
  ([0, 1], 0, [1]),
])
func deleteLinkedListNodeTest(nums: [Int], target: Int, outcome: [Int]) {
  var head = ListNode.fromArray(nums)
  var node = head
  while node != nil {
    if node?.val == target {
      break
    }
    node = node?.next
  }
  deleteLinkedListNode(&node)
  let actual = ListNode.toArray(head)
  #expect(actual == outcome)
}
