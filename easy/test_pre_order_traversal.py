import pytest
from easy.pre_order_traversal import pre_order_traversal

from dark_coding_challenges.data_structures import tree_node


@pytest.mark.parametrize(
    "nums, expected, _criteria",
    [
        ([], [], "Empty tree"),
        ([None], [], "Single null node"),
        ([1], [1], "Single node"),
        ([0], [0], "Single zero node"),
        ([1, 2], [1, 2], "Root with left child only"),
        ([1, None, 2], [1, 2], "Root with right child only"),
        ([1, 2, 3], [1, 2, 3], "Complete tree depth 1"),
        ([1, 2, None, 3, None, 4], [1, 2, 3, 4], "Left-skewed tree"),
        ([1, None, 2, None, 3, None, 4], [1, 2, 3, 4], "Right-skewed tree"),
        (
            [1, 2, None, 3, None, 4, None, 5],
            [1, 2, 3, 4, 5],
            "Deep left-skewed tree",
        ),
        (
            [1, 2, 3, 4, 5, 6, 7],
            [1, 2, 4, 5, 3, 6, 7],
            "Complete binary tree depth 2",
        ),
        (
            [100, 50, 150, 25, 75, 125, 175],
            [100, 50, 25, 75, 150, 125, 175],
            "Balanced BST structure",
        ),
        (
            [1, 2, 3, None, None, 4, 5],
            [1, 2, 3, 4, 5],
            "Nulls in middle level",
        ),
        ([1, 2, 3, None, 4, None, 5], [1, 2, 4, 3, 5], "Alternating nulls"),
        (
            [1, 2, 3, 4, None, None, None, 5],
            [1, 2, 4, 5, 3],
            "Deep left child only",
        ),
        ([1, None], [1], "Single trailing null"),
        ([1, None, None], [1], "Multiple trailing nulls"),
        (
            [1, 2, 3, None, None, None, None],
            [1, 2, 3],
            "Complete tree with trailing nulls",
        ),
        (
            [-50, None, 50, None, None, -25, 75],
            [-50, 50],
            "Extra values after complete branches (orphaned)",
        ),
        (
            [-1, None, -2, None, -3],
            [-1, -2, -3],
            "Right-skewed negative numbers",
        ),
        (
            [-10, -20, -30, -40, -50],
            [-10, -20, -40, -50, -30],
            "Complete tree with negatives",
        ),
        (
            [-50, None, 50, -25, 75],
            [-50, 50, -25, 75],
            "Mixed negative and positive",
        ),
        ([0, 0, 0, 0, 0], [0, 0, 0, 0, 0], "All zeros"),
        (
            [0, -1, 1, -2, 2, -3, 3],
            [0, -1, -2, 2, 1, -3, 3],
            "Zero root with mixed values",
        ),
        ([1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], "All duplicate values"),
        (
            [-2147483648, None, 2147483647],
            [-2147483648, 2147483647],
            "Min and max 32-bit integers",
        ),
        (
            [10, 5, 15, 3, 7, None, 20],
            [10, 5, 3, 7, 15, 20],
            "BST structure with missing node",
        ),
        (
            [5, 3, 8, 1, 4, None, 9, None, 2],
            [5, 3, 1, 2, 4, 8, 9],
            "Complex asymmetric tree",
        ),
        (
            [1, 2, 3, 4, None, 5, 6, None, None, None, None, 7],
            [1, 2, 4, 3, 5, 6, 7],
            "Mixed depth with sparse nulls",
        ),
        ([1, None, 2, 3], [1, 2, 3], "Right child with left grandchild"),
        (
            [1, 2, None, None, 3, None, 4, None, 5],
            [1, 2, 3, 4, 5],
            "Zigzag pattern",
        ),
        (
            [1, None, 2, 3, None, 4, None, 5],
            [1, 2, 3, 4, 5],
            "Right-heavy zigzag",
        ),
        (
            [1, 2, None, 3, 4, None, None, 5, 6],
            [1, 2, 3, 4, 5, 6],
            "Left subtree with deep right branches",
        ),
        (
            [10, 5, None, 3, None, 7, None, 1],
            [10, 5, 3, 7, 1],
            "Left child with alternating pattern",
        ),
        (
            [1, 2, 3, None, None, None, 4],
            [1, 2, 3, 4],
            "Right child of right child only",
        ),
        (
            [
                # fmt:off
                1, 2, None, 3, None, 4, None, 5, None, 6, None, 7, None, 8, None, 9, None, 10,
                # fmt:on
            ],
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            "Very deep left-skewed (10 levels)",
        ),
        (
            [
                # fmt:off
                1, None, 2, None, 3, None, 4, None, 5, None, 6, None, 7, None, 8, None, 9, None, 10,
                # fmt:on
            ],
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
            "Very deep right-skewed (10 levels)",
        ),
        (
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
            [1, 2, 4, 8, 9, 5, 10, 11, 3, 6, 12, 13, 7, 14, 15],
            "Complete binary tree depth 3 (15 nodes)",
        ),
        ([1, None, None, None, 2], [1], "Orphaned node after nulls"),
        (
            [1, 2, 3, None, None, None, None, None, None, 4],
            [1, 2, 3],
            "Node far beyond tree structure",
        ),
    ],
)
def test_pre_order_traversal(nums, expected, _criteria):
    root = tree_node.TreeNode.from_list(nums)
    assert pre_order_traversal(root) == expected
