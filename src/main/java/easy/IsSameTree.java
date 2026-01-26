package easy;

import helpers.TreeNode;

public class IsSameTree<T> {
  public boolean solve(TreeNode<T> p, TreeNode<T> q) {
    if (p == null && q == null) return true;
    if (p == null || q == null) return false;
    if (p.val != q.val) return false;
    return solve(p.left, q.left) && solve(p.right, q.right);
  }
}
