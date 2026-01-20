import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

List<int> preOrderTraversal(TreeNode? root) {
  if (root == null) return [];
  final List<int> result = [];
  final List<TreeNode> stack = [root];
  while (stack.isNotEmpty) {
    final current = stack.removeLast();
    final value = current.val;
    final right = current.right;
    final left = current.left;
    if (value != null) result.add(value);
    if (right != null) stack.add(right);
    if (left != null) stack.add(left);
  }
  return result;
}
