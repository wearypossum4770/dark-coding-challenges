import pytest
from easy.list_node import ListNode
from medium.delete_linked_list_node import delete_linked_list_node


@pytest.mark.parametrize(
    "nums, target, expected",
    [
        ([4, 5, 1, 9], 5, [4, 1, 9]),
        ([4, 5, 1, 9], 1, [4, 5, 9]),
        ([1, 2, 3, 4], 3, [1, 2, 4]),
        ([0, 1], 0, [1]),
    ],
)
def test_delete_linked_list_node(
    nums: list[int], target: int, expected: list[int]
):
    head = ListNode.from_array(nums)
    node = head
    while node != None:
        if node.val == target:
            break
        node = node.next
    delete_linked_list_node(node)
    result = ListNode.to_array(head)

    assert result == expected
