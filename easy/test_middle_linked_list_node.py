from sys import maxsize

import pytest
from easy.list_node import ListNode
from easy.middle_linked_list_node import middle_linked_list_node


@pytest.mark.parametrize(
    "nums, expected",
    (
        ([], []),
        ([1, 1, 1, 1, 1], [1, 1, 1]),
        ([-3, -2, -1, 0, 1, 2, 3], [0, 1, 2, 3]),
        ([1], [1]),
        ([1, 2], [2]),
        ([1, 2, 3], [2, 3]),
        ([1, 2, 3, 4], [3, 4]),
        ([1, 2, 3, 4, 5], [3, 4, 5]),
        ([1, 2, 3, 4, 5, 6], [4, 5, 6]),
    ),
)
def test_middle_linked_list_node(nums, expected):
    head = ListNode.from_array(nums)
    result = middle_linked_list_node(head)
    outcome = ListNode.to_array(result)
    assert outcome == expected
