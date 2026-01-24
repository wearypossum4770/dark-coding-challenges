from easy.list_node import ListNode


def middle_linked_list_node(head: ListNode) -> ListNode:
    slow = head
    fast = head
    while fast is not None and fast.next is not None:
        slow = slow.next
        fast = fast.next.next
    return slow
