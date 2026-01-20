import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';
import 'package:test/test.dart';
import 'package:dark_coding_challenges/easy/pre_order_traversal.dart';

class PreOrderTraversalTestCases {
  List<int?> nums;
  List<int> expected;
  String description;
  PreOrderTraversalTestCases(this.nums, this.expected, this.description);
}

void main() {
  group("\n\tFeature: Pre Order Tree Traversal", () {
    final testCases = [
      // ========== BASIC EDGE CASES ==========
      PreOrderTraversalTestCases([], [], "Empty tree"),
      PreOrderTraversalTestCases([null], [], "Single null node"),
      PreOrderTraversalTestCases([1], [1], "Single node"),
      PreOrderTraversalTestCases([0], [0], "Single zero node"),

      // ========== SIMPLE TREES ==========
      PreOrderTraversalTestCases([1, 2], [1, 2], "Root with left child only"),
      PreOrderTraversalTestCases([1, null, 2], [1, 2], "Root with right child only"),
      PreOrderTraversalTestCases([1, 2, 3], [1, 2, 3], "Complete tree depth 1"),

      // ========== SKEWED TREES ==========
      PreOrderTraversalTestCases([1, 2, null, 3, null, 4], [1, 2, 3, 4], "Left-skewed tree"),
      PreOrderTraversalTestCases([1, null, 2, null, 3, null, 4], [1, 2, 3, 4], "Right-skewed tree"),
      PreOrderTraversalTestCases([1, 2, null, 3, null, 4, null, 5], [1, 2, 3, 4, 5], "Deep left-skewed tree"),

      // ========== COMPLETE BINARY TREES ==========
      PreOrderTraversalTestCases([1, 2, 3, 4, 5, 6, 7], [1, 2, 4, 5, 3, 6, 7], "Complete binary tree depth 2"),
      PreOrderTraversalTestCases([100, 50, 150, 25, 75, 125, 175], [100, 50, 25, 75, 150, 125, 175], "Balanced BST structure"),

      // ========== TREES WITH NULLS IN MIDDLE ==========
      PreOrderTraversalTestCases([1, 2, 3, null, null, 4, 5], [1, 2, 3, 4, 5], "Nulls in middle level"),
      PreOrderTraversalTestCases([1, 2, 3, null, 4, null, 5], [1, 2, 4, 3, 5], "Alternating nulls"),
      PreOrderTraversalTestCases([1, 2, 3, 4, null, null, null, 5], [1, 2, 4, 5, 3], "Deep left child only"),

      // ========== TRAILING NULLS (should be ignored) ==========
      PreOrderTraversalTestCases([1, null], [1], "Single trailing null"),
      PreOrderTraversalTestCases([1, null, null], [1], "Multiple trailing nulls"),
      PreOrderTraversalTestCases([1, 2, 3, null, null, null, null], [1, 2, 3], "Complete tree with trailing nulls"),

      // ========== EXTRA NULLS (orphaned values) ==========
      PreOrderTraversalTestCases([-50, null, 50, null, null, -25, 75], [-50, 50], "Extra values after complete branches (orphaned)"),

      // ========== NEGATIVE NUMBERS ==========
      PreOrderTraversalTestCases([-1, null, -2, null, -3], [-1, -2, -3], "Right-skewed negative numbers"),
      PreOrderTraversalTestCases([-10, -20, -30, -40, -50], [-10, -20, -40, -50, -30], "Complete tree with negatives"),
      PreOrderTraversalTestCases([-50, null, 50, -25, 75], [-50, 50, -25, 75], "Mixed negative and positive"),

      // ========== ZEROS ==========
      PreOrderTraversalTestCases([0, 0, 0, 0, 0], [0, 0, 0, 0, 0], "All zeros"),
      PreOrderTraversalTestCases([0, -1, 1, -2, 2, -3, 3], [0, -1, -2, 2, 1, -3, 3], "Zero root with mixed values"),

      // ========== DUPLICATES ==========
      PreOrderTraversalTestCases([1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], "All duplicate values"),

      // ========== EXTREME VALUES ==========
      PreOrderTraversalTestCases([-2147483648, null, 2147483647], [-2147483648, 2147483647], "Min and max 32-bit integers"),

      // ========== COMPLEX ASYMMETRIC TREES ==========
      PreOrderTraversalTestCases([10, 5, 15, 3, 7, null, 20], [10, 5, 3, 7, 15, 20], "BST structure with missing node"),
      PreOrderTraversalTestCases([5, 3, 8, 1, 4, null, 9, null, 2], [5, 3, 1, 2, 4, 8, 9], "Complex asymmetric tree"),
      PreOrderTraversalTestCases([1, 2, 3, 4, null, 5, 6, null, null, null, null, 7], [1, 2, 4, 3, 5, 6, 7], "Mixed depth with sparse nulls"),

      // ========== DIABOLICAL EDGE CASES ==========
      PreOrderTraversalTestCases([1, null, 2, 3], [1, 2, 3], "Right child with left grandchild"),
      PreOrderTraversalTestCases([1, 2, null, null, 3, null, 4, null, 5], [1, 2, 3, 4, 5], "Zigzag pattern"),
      PreOrderTraversalTestCases([1, null, 2, 3, null, 4, null, 5], [1, 2, 3, 4, 5], "Right-heavy zigzag"),
      PreOrderTraversalTestCases([1, 2, null, 3, 4, null, null, 5, 6], [1, 2, 3, 4, 5, 6], "Left subtree with deep right branches"),
      PreOrderTraversalTestCases([10, 5, null, 3, null, 7, null, 1], [10, 5, 3, 7, 1], "Left child with alternating pattern"),
      PreOrderTraversalTestCases([1, 2, 3, null, null, null, 4], [1, 2, 3, 4], "Right child of right child only"),

      // ========== VERY DEEP TREES ==========
      PreOrderTraversalTestCases(
        [1, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        "Very deep left-skewed (10 levels)",
      ),
      PreOrderTraversalTestCases(
        [1, null, 2, null, 3, null, 4, null, 5, null, 6, null, 7, null, 8, null, 9, null, 10],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        "Very deep right-skewed (10 levels)",
      ),

      // ========== LARGE COMPLETE TREES ==========
      PreOrderTraversalTestCases(
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
        [1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15],
        "Complete binary tree depth 3 (15 nodes)",
      ),

      // ========== SPARSE TREES ==========
      PreOrderTraversalTestCases([1, null, null, null, 2], [1], "Orphaned node after nulls"),
      PreOrderTraversalTestCases([1, 2, 3, null, null, null, null, null, null, 4], [1, 2, 3], "Node far beyond tree structure"),
    ];

    for (final step in testCases) {
      final nums = step.nums;
      final expected = step.expected;
      final description = step.description;
      TreeNode? root = TreeNode.fromList(nums);

      test(
        "\n\t[$description]\n\tGiven: Tree represented as ${nums.length > 20 ? '${nums.take(20).toList()}...(${nums.length} nodes)' : nums}\n\tThen: Pre-order is $expected",
        () {
          List<int> actual = preOrderTraversal(root);
          expect(actual, equals(expected), reason: "Tree: $nums");
        },
      );
    }
  });
}
