package easy;

import helpers.TreeNode;

public class TreePathHasSum {
  public boolean solve(TreeNode<Integer> root, int targetSum) {
    if (root == null) return false;
    if (root.val == targetSum) return true;
    int remainder = targetSum - root.val;
    return solve(root.left, remainder) || solve(root.right, remainder);
  }
}
