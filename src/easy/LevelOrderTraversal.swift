import helpers

func levelOrderTraversal(_ root: TreeNode?) -> [[Int]] {
  guard let root = root else {
    return []
  }
  var result: [[Int]] = []
  var queue: [TreeNode?] = [root]
  while !queue.isEmpty {
    let size = queue.count
    var current = [Int]()
    for _ in 0..<size {
      if let node = queue.remove(at: 0) {
        current.append(node.val)
        if let left = node.left {
          queue.append(left)
        }
        if let right = node.right {
          queue.append(right)
        }
      }
    }
    result.append(current)
  }

  return result
}
