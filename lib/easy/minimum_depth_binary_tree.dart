import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

int minimumDepthBinaryTree(TreeNode? root) {
  if (root == null) return 0;
  TreeNode? left = root.left;
  TreeNode? right = root.right;
  if (left == null && right == null) return 1;
  if (left == null) return 1 + minimumDepthBinaryTree(right);
  if (right == null) return 1 + minimumDepthBinaryTree(left);
  return 1 + min(minimumDepthBinaryTree(left), minimumDepthBinaryTree(right));
}
