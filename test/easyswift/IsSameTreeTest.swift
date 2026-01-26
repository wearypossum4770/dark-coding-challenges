import Testing
import helpers

@testable import easy

@Test(arguments: [
  ([1, 2], [1, nil, 2], false),
  ([1, 2, 1], [1, 1, 2], false),
  // ✅ Both empty
  ([], [], true),
  // ❌ One empty, one not (many solutions fail this)
  ([], [1], false),
  ([1], [], false),
  // ✅ Single node equal
  ([1], [1], true),
  // ❌ Single node value mismatch
  ([1], [2], false),
  // ❌ Left child missing on one side
  ([1, 2], [1, nil], false),
  // ❌ Right child missing on one side
  ([1, nil, 2], [1, 2], false),
  // ❌ Structural mismatch but same values
  // Common false positive
  ([1, 2, nil], [1, nil, 2], false),
  // ✅ Same structure, deeper tree
  ([1, 2, 3], [1, 2, 3], true),
  // ❌ Same values, different structure
  ([1, 2, 3, nil, nil, 4, 5], [1, 2, 3, 4, 5], false),
  // ❌ Asymmetric depth (kills stack-based bugs)
  ([1, 2, nil, 3], [1, 2, nil, nil], false),
  // ❌ Identical traversal order, different trees
  // Preorder matches, structure does not
  ([1, 2, nil, nil, 3], [1, nil, 2, nil, 3], false),
  // ✅ Larger identical tree
  ([5, 3, 7, 2, 4, 6, 8], [5, 3, 7, 2, 4, 6, 8], true),
])
func isSameTreeTest(pArray: [Int?], qArray: [Int?], expected: Bool) {
  let p = TreeNode.fromArray(pArray)
  let q = TreeNode.fromArray(qArray)
  #expect(isSameTree(p, q) == expected)
}

@Test(arguments: [
  ("1 2 x x 3 x x", "1 2 x x 3 x x", true),
  ("1 2 x x 3 x x", "1 2 x x x", false),
  ("1 2 x x 3 x x", "1 x 2 x x", false),
  ("1 2 3 x x x x", "1 x 2 x 3 x x", false),
  ("x", "x", true),
  ("1 x x", "x", false),
  ("1 x x", "1 x x", true),
  ("1 x x", "2 x x", false),
  ("1 2 x x x", "1 x 2 x x", false),
  ("1 2 3 x x x x", "1 2 3 x x x x", true),
  ("1 2 3 x x x x", "1 2 4 x x x x", false),
  ("5 3 1 x x 4 x x 7 6 x x 9 x x", "5 3 1 x x 4 x x 7 6 x x 9 x x", true),
  ("1 2 4 x x 5 x x 3 6 x x 7 x x", "1 2 4 x x 5 x x 3 6 x x 8 x x", false),
  ("1 2 x x 3 x x", "1 x 2 x 3 x x", false),
  ("10 5 2 x x 7 x x 15 12 x x 20 x x", "10 5 2 x x 7 x x 15 12 x x 20 x x", true),
  ("1 x 2 x 3 x 4 x x", "1 x 2 x 3 x 4 x x", true),
  ("4 3 2 1 x x x x x", "4 3 2 1 x x x x x", true),
  (
    "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
    "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x", true,
  ),
  ("3 x 4 x 5 x 6 x x", "3 x 4 x 5 x 7 x x", false),
  ("100 50 25 x x 75 x x 150 125 x x 175 x x", "100 50 25 x x 75 x x 150 125 x x 175 x x", true),

])
func algoMonsterIsSameTreeTest(pString: String, qString: String, expected: Bool) {
  let p = TreeNode.fromArray(
    pString.split(separator: " ").map { $0 == "x" || $0 == "X" ? nil : Int($0) })
  let q = TreeNode.fromArray(
    qString.split(separator: " ").map { $0 == "x" || $0 == "X" ? nil : Int($0) })
  #expect(isSameTree(p, q) == expected)

}
