package easy;

import helpers.TreeNode;
import java.util.ArrayList;
import java.util.List;

record Pair<T, U>(T a, U b) {}

public class SumOfLeftLeaves {
  public int solve(TreeNode<Integer> root) {
    int count = 0;
    List<Pair<TreeNode<Integer>, Boolean>> stack = new ArrayList<>();
    stack.add(new Pair<>(root, false));
    while (!stack.isEmpty()) {
      Pair<TreeNode<Integer>, Boolean> tuple = stack.removeLast();
      TreeNode<Integer> node = tuple.a();
      Boolean isLeft = tuple.b();
      if (node.left == null && node.right == null && isLeft) {
        count += node.val;
      }
      if (node.left != null) stack.add(new Pair<>(node.left, true));
      if (node.right != null) stack.add(new Pair<>(node.right, false));
    }
    return count;
  }
}
