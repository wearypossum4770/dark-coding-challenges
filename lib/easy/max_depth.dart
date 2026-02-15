import "dart:math";

import "package:dark_coding_challenges/helpers/data_structures/tree_node.dart";

int maxDepth(TreeNode? root) {
  return (root == null) ? 0 : max(maxDepth(root.left), maxDepth(root.right)) + 1;
}
