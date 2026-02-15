import pytest
from easy.max_depth import max_depth

from dark_coding_challenges.data_structures.tree_node import TreeNode


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([3, 9, 20, None, None, 15, 7], 3),
        ([1, None, 2], 2),
        ([1], 1),
        ([], 0),
        ([1, 2, None, 3, None, 4, None, 5], 5),
        ([1, None, 2, None, 3, None, 4, None, 5], 5),
        ([1, 2, 3, 4, 5, 6, 7], 3),
        ([1, 2, 3, 4, 5, 6, None], 3),
        ([5, 4, 6, 3, None, None, 7, None, 2], 4),
        ([-100, -100, -100, -100, -100], 3),
        ([0], 1),
        ([100], 1),
        ([10, 20, None, 30, None, 40, None, 50], 5),
    ],
)
def test_max_depth(nums, expected):
    root = TreeNode.from_list(nums)
    assert max_depth(root) == expected
