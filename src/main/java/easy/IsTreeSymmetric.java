package easy;

import helpers.TreeNode;

public class IsTreeSymmetric<T> {
  public boolean checkMirror(TreeNode<T> left, TreeNode<T> right) {
    if (left == null && right == null) return true;
    if (left == null || right == null) return false;
    return left.val == right.val
        && checkMirror(left.left, right.right)
        && checkMirror(left.right, right.left);
  }

  public boolean solve(TreeNode<T> root) {
    if (root == null) return true;
    return checkMirror(root.left, root.right);
  }
}
