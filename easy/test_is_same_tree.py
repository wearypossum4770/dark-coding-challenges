import pytest
from easy.is_same_tree import is_same_tree

from dark_coding_challenges.data_structures.tree_node import TreeNode


@pytest.mark.parametrize(
    "p, q, expected",
    [
        ([1, 2], [1, None, 2], False),
        ([1, 2, 1], [1, 1, 2], False),
        ([], [], True),
        ([], [1], False),
        ([1], [], False),
        ([1], [1], True),
        ([1], [2], False),
        ([1, 2], [1, None], False),
        ([1, None, 2], [1, 2], False),
        ([1, 2, None], [1, None, 2], False),
        ([1, 2, 3], [1, 2, 3], True),
        ([1, 2, 3, None, None, 4, 5], [1, 2, 3, 4, 5], False),
        ([1, 2, None, 3], [1, 2, None, None], False),
        ([1, 2, None, None, 3], [1, None, 2, None, 3], False),
        ([5, 3, 7, 2, 4, 6, 8], [5, 3, 7, 2, 4, 6, 8], True),
    ],
)
def test_is_same_tree(p: list[int], q: list[int], expected: bool):
    tree1 = TreeNode.from_list(p)
    tree2 = TreeNode.from_list(q)
    assert is_same_tree(tree1, tree2) == expected


@pytest.mark.parametrize(
    "p, q, expected",
    [
        ("1 2 x x 3 x x", "1 2 x x 3 x x", True),
        ("1 2 x x 3 x x", "1 2 x x x", False),
        ("1 2 x x 3 x x", "1 x 2 x x", False),
        ("1 2 3 x x x x", "1 x 2 x 3 x x", False),
        ("x", "x", True),
        ("1 x x", "x", False),
        ("1 x x", "1 x x", True),
        ("1 x x", "2 x x", False),
        ("1 2 x x x", "1 x 2 x x", False),
        ("1 2 3 x x x x", "1 2 3 x x x x", True),
        ("1 2 3 x x x x", "1 2 4 x x x x", False),
        (
            "5 3 1 x x 4 x x 7 6 x x 9 x x",
            "5 3 1 x x 4 x x 7 6 x x 9 x x",
            True,
        ),
        (
            "1 2 4 x x 5 x x 3 6 x x 7 x x",
            "1 2 4 x x 5 x x 3 6 x x 8 x x",
            False,
        ),
        ("1 2 x x 3 x x", "1 x 2 x 3 x x", False),
        (
            "10 5 2 x x 7 x x 15 12 x x 20 x x",
            "10 5 2 x x 7 x x 15 12 x x 20 x x",
            True,
        ),
        ("1 x 2 x 3 x 4 x x", "1 x 2 x 3 x 4 x x", True),
        ("4 3 2 1 x x x x x", "4 3 2 1 x x x x x", True),
        (
            "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
            "8 4 2 1 x x 3 x x 6 5 x x 7 x x 12 10 9 x x 11 x x 14 13 x x 15 x x",
            True,
        ),
        ("3 x 4 x 5 x 6 x x", "3 x 4 x 5 x 7 x x", False),
        (
            "100 50 25 x x 75 x x 150 125 x x 175 x x",
            "100 50 25 x x 75 x x 150 125 x x 175 x x",
            True,
        ),
    ],
)
def test_algo_monster(p: str, q: str, expected: bool):
    tree1 = TreeNode.from_string(p)
    tree2 = TreeNode.from_string(q)
    assert is_same_tree(tree1, tree2) == expected
