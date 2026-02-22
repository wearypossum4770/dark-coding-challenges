import helpers

func treePathHasSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
  guard let root = root else {
    return false
  }
  if root.left == nil && root.right == nil {
    return targetSum == root.val
  }
  let remaining = targetSum - root.val
  return treePathHasSum(root.left, remaining) || treePathHasSum(root.right, remaining)
}
