import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

int sumOfLeftLeaves(TreeNode? root) {
  int count = 0;
  List<(TreeNode?, bool)> stack = [(root, false)];
  while (stack.isNotEmpty) {
    final (node, isLeft) = stack.removeLast();
    if (node != null && node.left == null && node.right == null && isLeft) {
      count += node.val ?? 0;
    }
    final right = node?.right;
    final left = node?.left;
    if (right != null) stack.add((right, false));
    if (left != null) stack.add((left, true));
  }
  return count;
}
