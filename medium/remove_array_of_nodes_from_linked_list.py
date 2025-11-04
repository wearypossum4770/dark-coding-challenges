from easy.list_node import BaseListNode


def remove_array_of_nodes_from_linked_list(
    nums: list[int], head: BaseListNode
):
    unique = set(nums)
    dummy = BaseListNode(0, head)
    current = dummy
    while current.next:
        if current.next.val in unique:
            current.next = current.next.next
        else:
            current = current.next
    return dummy.next
