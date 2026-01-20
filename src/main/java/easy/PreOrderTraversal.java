package easy;

import helpers.TreeNode;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.List;

public class PreOrderTraversal<T> {
  public int[] solveAsPrimitive(TreeNode<Integer> root) {
    return solve(root).stream().mapToInt(Integer::intValue).toArray();
  }

  public List<Integer> solve(TreeNode<Integer> root) {
    List<Integer> result = new ArrayList<>();
    if (root == null) return result;
    ArrayDeque<TreeNode<Integer>> queue = new ArrayDeque<>();
    queue.addLast(root);
    while (!queue.isEmpty()) {
      TreeNode<Integer> current = queue.removeLast();
      result.add(current.val);
      if (current.right != null) queue.addLast(current.right);
      if (current.left != null) queue.addLast(current.left);
    }
    return result;
  }
}
