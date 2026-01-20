import Testing
import helpers

@testable import easy

@Test(arguments: [
  ([], [], "Empty tree"),
  ([nil], [], "Single null node"),
  ([1], [1], "Single node"),
  ([0], [0], "Single zero node"),
  ([1, 2], [1, 2], "Root with left child only"),
  ([1, nil, 2], [1, 2], "Root with right child only"),
  ([1, 2, 3], [1, 2, 3], "Complete tree depth 1"),
  ([1, 2, nil, 3, nil, 4], [1, 2, 3, 4], "Left-skewed tree"),
  ([1, nil, 2, nil, 3, nil, 4], [1, 2, 3, 4], "Right-skewed tree"),
  ([1, 2, nil, 3, nil, 4, nil, 5], [1, 2, 3, 4, 5], "Deep left-skewed tree"),
  ([1, 2, 3, 4, 5, 6, 7], [1, 2, 4, 5, 3, 6, 7], "Complete binary tree depth 2"),
  ([100, 50, 150, 25, 75, 125, 175], [100, 50, 25, 75, 150, 125, 175], "Balanced BST structure"),
  ([1, 2, 3, nil, nil, 4, 5], [1, 2, 3, 4, 5], "Nulls in middle level"),
  ([1, 2, 3, nil, 4, nil, 5], [1, 2, 4, 3, 5], "Alternating nulls"),
  ([1, 2, 3, 4, nil, nil, nil, 5], [1, 2, 4, 5, 3], "Deep left child only"),
  ([1, nil], [1], "Single trailing null"),
  ([1, nil, nil], [1], "Multiple trailing nulls"),
  ([1, 2, 3, nil, nil, nil, nil], [1, 2, 3], "Complete tree with trailing nulls"),
  (
    [-50, nil, 50, nil, nil, -25, 75], [-50, 50], "Extra values after complete branches (orphaned)"
  ),
  ([-1, nil, -2, nil, -3], [-1, -2, -3], "Right-skewed negative numbers"),
  ([-10, -20, -30, -40, -50], [-10, -20, -40, -50, -30], "Complete tree with negatives"),
  ([-50, nil, 50, -25, 75], [-50, 50, -25, 75], "Mixed negative and positive"),
  ([0, 0, 0, 0, 0], [0, 0, 0, 0, 0], "All zeros"),
  ([0, -1, 1, -2, 2, -3, 3], [0, -1, -2, 2, 1, -3, 3], "Zero root with mixed values"),
  ([1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], "All duplicate values"),
  (
    [-2_147_483_648, nil, 2_147_483_647], [-2_147_483_648, 2_147_483_647],
    "Min and max 32-bit integers"
  ),
  ([10, 5, 15, 3, 7, nil, 20], [10, 5, 3, 7, 15, 20], "BST structure with missing node"),
  ([5, 3, 8, 1, 4, nil, 9, nil, 2], [5, 3, 1, 2, 4, 8, 9], "Complex asymmetric tree"),
  (
    [1, 2, 3, 4, nil, 5, 6, nil, nil, nil, nil, 7], [1, 2, 4, 3, 5, 6, 7],
    "Mixed depth with sparse nulls"
  ),
  ([1, nil, 2, 3], [1, 2, 3], "Right child with left grandchild"),
  ([1, 2, nil, nil, 3, nil, 4, nil, 5], [1, 2, 3, 4, 5], "Zigzag pattern"),
  ([1, nil, 2, 3, nil, 4, nil, 5], [1, 2, 3, 4, 5], "Right-heavy zigzag"),
  (
    [1, 2, nil, 3, 4, nil, nil, 5, 6], [1, 2, 3, 4, 5, 6], "Left subtree with deep right branches"
  ),
  ([10, 5, nil, 3, nil, 7, nil, 1], [10, 5, 3, 7, 1], "Left child with alternating pattern"),
  ([1, 2, 3, nil, nil, nil, 4], [1, 2, 3, 4], "Right child of right child only"),
  (
    [1, 2, nil, 3, nil, 4, nil, 5, nil, 6, nil, 7, nil, 8, nil, 9, nil, 10],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "Very deep left-skewed (10 levels)"
  ),
  (
    [1, nil, 2, nil, 3, nil, 4, nil, 5, nil, 6, nil, 7, nil, 8, nil, 9, nil, 10],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "Very deep right-skewed (10 levels)"
  ),
  (
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    [1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15], "Complete binary tree depth 3 (15 nodes)"
  ),
  ([1, nil, nil, nil, 2], [1], "Orphaned node after nulls"),
  ([1, 2, 3, nil, nil, nil, nil, nil, nil, 4], [1, 2, 3], "Node far beyond tree structure"),
])
func preOrderTraversalTest(nums: [Int?], expect: [Int], criteria: String) {
  let root = TreeNode.fromArray(nums)
  #expect(preOrderTraversal(root) == expect)

}
