import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/max_depth.dart';
import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

class MaxDepthTestCases {
  List<int?> nums;
  int expected;
  MaxDepthTestCases(this.nums, this.expected);
}

void main() {
  group("\nFeature:", () {
    final testCases = [
      MaxDepthTestCases([3, 9, 20, null, null, 15, 7], 3),
      MaxDepthTestCases([1, null, 2], 2),
      MaxDepthTestCases([1], 1),
      MaxDepthTestCases([], 0),
      MaxDepthTestCases([1, 2, null, 3, null, 4, null, 5], 5),
      MaxDepthTestCases([1, null, 2, null, 3, null, 4, null, 5], 5),
      MaxDepthTestCases([1, 2, 3, 4, 5, 6, 7], 3),
      MaxDepthTestCases([1, 2, 3, 4, 5, 6, null], 3),
      MaxDepthTestCases([5, 4, 6, 3, null, null, 7, null, 2], 4),
      MaxDepthTestCases([-100, -100, -100, -100, -100], 3),
      MaxDepthTestCases([0], 1),
      MaxDepthTestCases([100], 1),
      MaxDepthTestCases([10, 20, null, 30, null, 40, null, 50], 5),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final root = TreeNode.fromList(nums);
      final expected = step.expected;
      test("\n\tGiven: the tree $nums.\n\tThen: its maximum depth is $expected.", () {
        int actual = maxDepth(root);
        expect(actual, equals(expected));
      });
    }
  });
}
