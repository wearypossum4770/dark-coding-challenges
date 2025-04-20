import Testing

@testable import easy

@Test(arguments: [
  ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
  ([1, 2], [2, 1]),
  ([], []),
  (nil, []),
  ([1, 1, 2, 2, 3], [3, 2, 2, 1, 1]),
])
func reverseLinkedListTest(nums: [Int]?, outcome: [Int]) {
  let head = LinkedListNode.fromArray(nums)
  let result = LinkedListNode.toArray(reverseLinkedList(head))
  #expect(result == outcome)
}
