package easy;

import helpers.TreeNode;

public class MinimumDepthBinaryTree {
  public int solve(TreeNode root) {
    if (root == null) return 0;
    if (root.left == null && root.right == null) return 1;
    if (root.left == null) return 1 + solve(root.right);
    if (root.right == null) return 1 + solve(root.left);

    return 1 + Math.min(solve(root.left), solve(root.right));
  }
}
