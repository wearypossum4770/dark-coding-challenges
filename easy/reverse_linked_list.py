from easy.data_structures import ListNode


def reverse_linked_list(head: ListNode) -> ListNode:
    current, previous, next_node = head, None, None
    while current:
        next_node = current.next
        current.next = previous
        previous = current
        current = next_node
    return previous
