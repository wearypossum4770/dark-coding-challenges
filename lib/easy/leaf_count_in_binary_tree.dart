import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

int leafCountInBinaryTree(TreeNode? root) {
  if (root == null) return 0;
  if (root.left == null && root.right == null) return 1;
  return leafCountInBinaryTree(root.left) + leafCountInBinaryTree(root.right);
}
