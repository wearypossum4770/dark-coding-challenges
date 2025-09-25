from easy.list_node import ListNode


def delete_linked_list_node(node: ListNode):
    node.val = node.next.val
    node.next = node.next.next
