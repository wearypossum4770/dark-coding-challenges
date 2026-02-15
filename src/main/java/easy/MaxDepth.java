package easy;

import helpers.TreeNode;

public class MaxDepth {
  public int solve(TreeNode<Integer> root) {
    if (root == null) return 0;
    return Math.max(solve(root.left), solve(root.right)) + 1;
  }
}
