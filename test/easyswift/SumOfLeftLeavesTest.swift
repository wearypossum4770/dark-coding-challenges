import Testing
import helpers

@testable import easy

@Test(arguments: [
  ([], 0),
  ([1], 0),
  ([1, 2], 2),
  ([1, nil, 3], 0),
  ([1, 2, 3], 2),
  ([3, 9, 20, nil, nil, 15, 7], 24),
  ([1, 2, nil, 3, nil, 4], 4),
  ([1, nil, 2, nil, 3, nil, 4], 0),
  ([1, 2, 3, 4, 5], 4),
  ([1, 2, 3, nil, 4], 0),
  ([0, -1, -2], -1),
  ([1, 2, nil, nil, 3], 0),
  ([1, nil, 2, 3], 3),
  ([1, 2, 3, 4, nil, nil, 5], 4),
])
func sumOfLeftLeavesTest(nums: [Int?], expect: Int) {
  let root = TreeNode.fromArray(nums)
  #expect(sumOfLeftLeaves(root) == expect)
}
