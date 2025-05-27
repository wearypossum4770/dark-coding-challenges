import Testing

@testable import easy

@Test(arguments: [
  ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
  ([1, 2], [2, 1]),
  ([], []),
  (nil, []),
  ([1, 1, 2, 2, 3], [3, 2, 2, 1, 1]),
]) func reverseLinkedListTest(input: [Int]?, output: [Int]) {
  let head = ListNode<Int>.fromArray(input)
  let result: ListNode<Int>? = reverseLinkedList(head)
  let outcome = ListNode<Int>.toArray(result)
  #expect(output == outcome)
}
