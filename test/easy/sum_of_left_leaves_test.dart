import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/sum_of_left_leaves.dart';
import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

class SumOfLeftLeavesTestCases {
  List<int?> nums;
  int expected;
  SumOfLeftLeavesTestCases(this.nums, this.expected);
}

void main() {
  group("\n\tFeature: Sum of Left Leaves", () {
    final testCases = [
      SumOfLeftLeavesTestCases([], 0),
      SumOfLeftLeavesTestCases([1], 0),
      SumOfLeftLeavesTestCases([1, 2], 2),
      SumOfLeftLeavesTestCases([1, null, 3], 0),
      SumOfLeftLeavesTestCases([1, 2, 3], 2),
      SumOfLeftLeavesTestCases([3, 9, 20, null, null, 15, 7], 24),
      SumOfLeftLeavesTestCases([1, 2, null, 3, null, 4], 4),
      SumOfLeftLeavesTestCases([1, null, 2, null, 3, null, 4], 0),
      SumOfLeftLeavesTestCases([1, 2, 3, 4, 5], 4),
      SumOfLeftLeavesTestCases([1, 2, 3, null, 4], 0),
      SumOfLeftLeavesTestCases([0, -1, -2], -1),
      SumOfLeftLeavesTestCases([1, 2, null, null, 3], 0),
      SumOfLeftLeavesTestCases([1, null, 2, 3], 3),
      SumOfLeftLeavesTestCases([1, 2, 3, 4, null, null, 5], 4),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      test("\n\tGiven: the tree $nums.\n\tThen: the sum of left leaves is $expected.", () {
        TreeNode? root = TreeNode.fromList(nums);
        int actual = sumOfLeftLeaves(root);
        expect(actual, equals(expected));
      });
    }
  });
}
