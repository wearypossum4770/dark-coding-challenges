import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/middle_linked_list_node.dart';
import 'package:dark_coding_challenges/easy/list_node.dart';

class MiddleLinkedListNodeTestCases<T> {
  List<T> nums;
  List<T> expected;
  MiddleLinkedListNodeTestCases(this.nums, this.expected);
}

void main() {
  group("Middle Linked List Node Tests:", () {
    final testCases = [
      MiddleLinkedListNodeTestCases([], []),
      MiddleLinkedListNodeTestCases([0x7FFFFFFFFFFFFFFF], [0x7FFFFFFFFFFFFFFF]),
      MiddleLinkedListNodeTestCases([0x7FFFFFFFFFFFFFFF, 0x7FFFFFFFFFFFFFFF], [0x7FFFFFFFFFFFFFFF]),
      MiddleLinkedListNodeTestCases([1, 1, 1, 1, 1], [1, 1, 1]),
      MiddleLinkedListNodeTestCases([-3, -2, -1, 0, 1, 2, 3], [0, 1, 2, 3]),
      MiddleLinkedListNodeTestCases([1], [1]),
      MiddleLinkedListNodeTestCases([1, 2], [2]),
      MiddleLinkedListNodeTestCases([1, 2, 3], [2, 3]),
      MiddleLinkedListNodeTestCases([1, 2, 3, 4], [3, 4]),
      MiddleLinkedListNodeTestCases([1, 2, 3, 4, 5], [3, 4, 5]),
      MiddleLinkedListNodeTestCases([1, 2, 3, 4, 5, 6], [4, 5, 6]),
    ];

    for (final testCase in testCases) {
      test("Testing middle node for list: ${testCase.nums}", () {
        final linkedList = ListNode.fromArray(testCase.nums);
        final resultLinkedList = middleLinkedListNode(linkedList);
        final resultArray = ListNode.toArray(resultLinkedList);
        expect(resultArray, equals(testCase.expected));
      });
    }
  });
}
