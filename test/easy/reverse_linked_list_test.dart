import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/reverse_linked_list.dart';
import 'package:dark_coding_challenges/easy/list_node.dart';

class ReverseLinkedListTestCases {
  List<int> nums;
  List<int> expected;
  ReverseLinkedListTestCases(this.nums, this.expected);
}

void main() {
  group("\n\tFeature: Reverse Linked List", () {
    final testCases = [
      ReverseLinkedListTestCases([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
      ReverseLinkedListTestCases([1, 2], [2, 1]),
      ReverseLinkedListTestCases([], []),
    ];

    for (final step in testCases) {
      // Safely cast values to List<int> for nums and expected
      final nums = step.nums;
      final node = ListNode.fromArray(nums);
      final expected = step.expected;
      final result = reverseLinkedList(node);
      final output = ListNode.toArray(result);

      test(
        "\n\tGiven: a linked list $node\n\t\t(represented as $nums).\n\tWhen: nodes are reversed.\n\tThen: it will be $output\n\t\t(represented as $expected)",
        () {
          expect(output, equals(expected));
        },
      );
    }
  });
}
