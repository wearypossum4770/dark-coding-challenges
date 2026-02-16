import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/is_tree_symmetric.dart';
import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

class IsTreeSymmetricTestCases {
  List<int?> nums;
  bool expected;
  IsTreeSymmetricTestCases(this.nums, this.expected);
}

void main() {
  group("\nFeature:", () {
    final testCases = [
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5], true),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 3], true),
      IsTreeSymmetricTestCases([], true),
      IsTreeSymmetricTestCases([1], true),
      IsTreeSymmetricTestCases([1, 2, 2], true),
      IsTreeSymmetricTestCases([1, 2, 3], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 3], true),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 5], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, null, null, 3], true),
      IsTreeSymmetricTestCases([1, 2, 2, null, 3, null, 3], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 3, null, null], false),
      IsTreeSymmetricTestCases([1, null, null], true),
      IsTreeSymmetricTestCases([1, 2, null], false),
      IsTreeSymmetricTestCases([1, null, 2], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 6, 5], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, null, 4, 5, 6, null, null, 7, 5], false),
      IsTreeSymmetricTestCases([0], true),
      IsTreeSymmetricTestCases([0, 0, 0], true),
      IsTreeSymmetricTestCases([0, 0, 1], false),
      IsTreeSymmetricTestCases([1, 2, 2, 2, 2, 2, 2], true),
      IsTreeSymmetricTestCases([1, 2, 3, 4, 5, 6, 7], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4], true),
      IsTreeSymmetricTestCases([5, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2], true),
      IsTreeSymmetricTestCases([1, 2, null, 3, null, null, null], false),
      IsTreeSymmetricTestCases([1, null, null, null, null, null, null], true),
      IsTreeSymmetricTestCases([2, 3, 3, 4, 5, 5, 4, 6, 7, 8, 8, 7, 6], false),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 5], true),
      IsTreeSymmetricTestCases([1, 2, 2, 3, 4, 4, 3, 5, 6, 7, 8, 8, 7, 6, 6], false),
      IsTreeSymmetricTestCases([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1], true),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      final root = TreeNode.fromList(nums);
      test("\n\tGiven: the tree $nums.\n\tThen: it is symmetrical $expected.", () {
        bool actual = isTreeSymmetric(root);
        expect(actual, equals(expected));
      });
    }
  });
}
