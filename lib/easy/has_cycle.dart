import 'package:dark_coding_challenges/easy/merge_two_linked_lists.dart';

bool hasCycle(ListNode? head) {
  ListNode? fast = head;
  ListNode? slow = head;
  while (fast != null && fast.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
    if (fast == slow) return true;
  }
  return false;
}
