import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';
import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/leaf_count_in_binary_tree.dart';

class LeafCountInBinaryTreeTestCases {
  List<int?> nums;
  int expected;
  LeafCountInBinaryTreeTestCases(this.nums, this.expected);
}

void main() {
  group("Feature:", () {
    final testCases = [
      LeafCountInBinaryTreeTestCases([1, 10, 39, 5], 2),
      LeafCountInBinaryTreeTestCases([4, 8, 10, 7, null, 5, 1, 3], 3),
      LeafCountInBinaryTreeTestCases([50, 30, 70, 20, 40, 60, 80, null, null, null, null, 65], 4),
      LeafCountInBinaryTreeTestCases([30, 25, 35, 20, 28, null, 40, null, null, 27], 3),
      LeafCountInBinaryTreeTestCases([1, 2, 3, -1, -1, -1, -1], 4),
      LeafCountInBinaryTreeTestCases([1, 2, 3, null, null, null, null], 2),
      LeafCountInBinaryTreeTestCases([1, 2, 3, 4, 5, null, null, null, null, null, null], 3),
      LeafCountInBinaryTreeTestCases([10, 20, 30, 40, 50, 60, 70], 4),
      LeafCountInBinaryTreeTestCases([null], 0),
      LeafCountInBinaryTreeTestCases([5], 1),
      LeafCountInBinaryTreeTestCases([1, null, null], 1),
      LeafCountInBinaryTreeTestCases([1, 2, null, 3, null, 4, null, 5, null], 1),
      LeafCountInBinaryTreeTestCases([1, null, 2, null, 3, null, 4, null, 5, null, 6], 1),
      LeafCountInBinaryTreeTestCases([50, 30, 70, 20, 40, 60, 80, null, null, null, null, null, null, null, null], 4),
      LeafCountInBinaryTreeTestCases([1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10], 1),
      LeafCountInBinaryTreeTestCases([-5, -8, -3, -12, -7, null, null, null, null, null, null], 3),
      LeafCountInBinaryTreeTestCases([100000, 99999, 1, 2, null, null, null, 3, 4, 5, 6], 4),
      LeafCountInBinaryTreeTestCases([-42, 42, -42, 42, -42, 42, -42], 4),
      LeafCountInBinaryTreeTestCases([7, null, 8, null, 9, null, 10, null, 11, null, 12, null, 13], 1),
      LeafCountInBinaryTreeTestCases([1, 2, 3, null, null, null, 4, null, null, null, null, null, null, null, 5], 2),
      LeafCountInBinaryTreeTestCases([99999, null, null], 1),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      final root = TreeNode.fromList(nums);
      test("\n\tGiven: the binary tree $nums.\n\tThen: it has $expected leaves.", () {
        int actual = leafCountInBinaryTree(root);
        expect(actual, equals(expected));
      });
    }
  });
}
