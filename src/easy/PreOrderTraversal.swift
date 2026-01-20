import helpers

func preOrderTraversal(_ root: TreeNode?) -> [Int] {
  guard let root = root else {
    return []
  }
  var result = [Int]()
  var stack: [TreeNode] = [root]
  while !stack.isEmpty {
    if let current = stack.popLast() {
      result.append(current.val)
      if let right = current.right {
        stack.append(right)
      }
      if let left = current.left {
        stack.append(left)
      }
    }
  }
  return result
}
