import 'package:dark_coding_challenges/helpers/data_structures/tree_node.dart';

List<List<int>> levelOrderTraversal(TreeNode? root) {
  if (root == null) return [];
  List<List<int>> result = [];
  List<TreeNode?> stack = [root];
  while (stack.isNotEmpty) {
    List<int> current = [];
    int size = stack.length;
    for (int i = 0; i < size; i++) {
      TreeNode? node = stack.removeAt(0);
      int? value = node?.val;
      if (value != null) current.add(value);
      if (node?.left != null) stack.add(node?.left);
      if (node?.right != null) stack.add(node?.right);
    }
    result.add(current);
  }

  return result;
}
