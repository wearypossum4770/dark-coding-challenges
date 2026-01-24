import Testing

@testable import easy

@Test(arguments: [
  ([1, 2, 3, 4, 5], [3, 4, 5]),
  ([1, 2, 3, 4, 5, 6], [4, 5, 6]),
])
func middleLinkedListNodeTest(input: [Int], expected: [Int]) {
  let nums = ListNode.fromArray(input)
  let result = middleLinkedListNode(nums)
  let outcome = ListNode<Int>.toArray(result)
  #expect(expected == outcome)
}
