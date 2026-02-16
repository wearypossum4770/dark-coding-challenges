import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

bool isTreeSymmetric(TreeNode? root) {
  if (root == null) return true;
  bool checkMirror(TreeNode? lhs, TreeNode? rhs) {
    if (lhs == null && rhs == null) return true;
    if (lhs == null || rhs == null) return false;
    return lhs.val == rhs.val && checkMirror(lhs.left, rhs.right) && checkMirror(lhs.right, rhs.left);
  }

  return checkMirror(root.left, root.right);
}
