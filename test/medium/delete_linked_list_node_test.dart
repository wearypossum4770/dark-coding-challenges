import 'package:test/test.dart';
import 'package:dark_coding_challenges/medium/delete_linked_list_node.dart';
import 'package:dark_coding_challenges/easy/list_node.dart';

class DeleteLinkedListNodeTestCases {
  List<int> nums;
  int target;
  List<int> expected;
  DeleteLinkedListNodeTestCases(this.nums, this.target, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      DeleteLinkedListNodeTestCases([4, 5, 1, 9], 5, [4, 1, 9]),
      DeleteLinkedListNodeTestCases([4, 5, 1, 9], 1, [4, 5, 9]),
      DeleteLinkedListNodeTestCases([1, 2, 3, 4], 3, [1, 2, 4]),
      DeleteLinkedListNodeTestCases([0, 1], 0, [1]),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final target = step.target;
      final expected = step.expected;
        test("\n\tGiven: the linked list $nums anq", () {
        ListNode<int>? head = ListNode.fromArray(nums);
        ListNode<int>? node = head;
        while (node != null) {
          if (node.val == target) break;
          node = node.next;
        }
        deleteLinkedListNode(node);
        List<int> actual = ListNode.toArray(head);
        expect(actual, equals(expected));
      });
    }
  });
}
