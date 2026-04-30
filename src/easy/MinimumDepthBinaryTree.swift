import helpers

func minimumDepthBinaryTree(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  if root.left == nil && root.right == nil { return 1 }
  if root.left == nil {
    return 1 + minimumDepthBinaryTree(root.right)
  }
  if root.right == nil {
    return 1 + minimumDepthBinaryTree(root.left)
  }
  return 1 + min(minimumDepthBinaryTree(root.left), minimumDepthBinaryTree(root.right))

}
