import pytest
from easy.data_structures import ListNode
from easy.reverse_linked_list import reverse_linked_list


@pytest.mark.parametrize(
    "nums, expected",
    (
        (ListNode.from_list([1, 2, 3, 4, 5]), [5, 4, 3, 2, 1]),
        (ListNode.from_list([1, 2]), [2, 1]),
        (ListNode.from_list([]), []),
    ),
)
def test_reverse_linked_list(nums: ListNode | None, expected: list[int]):
    result = reverse_linked_list(nums)
    output = ListNode.to_array(result)
    assert output == expected
