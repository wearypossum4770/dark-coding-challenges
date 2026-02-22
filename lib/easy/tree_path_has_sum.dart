import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

bool treePathHasSum(TreeNode? root, int targetSum) {
  if (root == null) return false;
  final value = root.val;
  if (value == null) return false;
  int remainder = targetSum - value;
  return treePathHasSum(root.left, remainder) || treePathHasSum(root.right, remainder);
}
