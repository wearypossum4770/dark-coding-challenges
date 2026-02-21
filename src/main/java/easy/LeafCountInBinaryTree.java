package easy;

import helpers.TreeNode;

public class LeafCountInBinaryTree {
  public int solve(TreeNode<Integer> root) {
    if (root == null) return 0;
    if (root.left == null && root.right == null) return 1;
    return solve(root.left) + solve(root.right);
  }
}
