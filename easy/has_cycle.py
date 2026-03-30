from easy.list_node import ListNode


def has_cycle(head: ListNode | None) -> bool:
    fast, slow = head, head
    while fast is not None and fast.next is not None:
        slow = slow.next
        fast = fast.next.next
        if fast is slow:
            return True
    return False
