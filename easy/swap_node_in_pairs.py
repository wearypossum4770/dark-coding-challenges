# here i wrote a code in optimized approach based on swap_node_in_pairs problem
# here i did from leetcode then i pasted it here 




# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode(0)
        dummy.next = head
        curr = dummy

        while curr.next and curr.next.next:
            a = curr.next
            b = a.next

            # Swap will be done here :]
            curr.next, a.next, b.next = b, b.next, a

            curr = a  

        return dummy.next