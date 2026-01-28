import pytest
from easy.sum_of_left_leaves import sum_of_left_leaves

from dark_coding_challenges.data_structures.tree_node import TreeNode


@pytest.mark.parametrize(
    "nums, expected",
    [
        ([], 0),
        ([1], 0),
        ([1, 2], 2),
        ([1, None, 3], 0),
        ([1, 2, 3], 2),
        ([3, 9, 20, None, None, 15, 7], 24),
        ([1, 2, None, 3, None, 4], 4),
        ([1, None, 2, None, 3, None, 4], 0),
        ([1, 2, 3, 4, 5], 4),
        ([1, 2, 3, None, 4], 0),
        ([0, -1, -2], -1),
        ([1, 2, None, None, 3], 0),
        ([1, None, 2, 3], 3),
        ([1, 2, 3, 4, None, None, 5], 4),
    ],
)
def test_sum_of_left_leaves(nums: list[int | None], expected: int):
    root = TreeNode.from_list(nums)
    assert sum_of_left_leaves(root) == expected
