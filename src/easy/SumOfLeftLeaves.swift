import helpers

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
  var count = 0
  var stack = [(root, false)]
  while !stack.isEmpty {
    if let (current, isLeft) = stack.popLast() {
      if current?.left == nil && current?.right == nil && isLeft {
        count += current?.val ?? 0
      }
      if current?.left != nil {
        stack.append((current?.left, true))
      }
      if current?.right != nil {
        stack.append((current?.right, false))
      }
    }
  }
  return count
}
