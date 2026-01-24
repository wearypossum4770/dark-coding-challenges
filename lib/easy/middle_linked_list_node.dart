import 'package:dark_coding_challenges/easy/list_node.dart';

ListNode<T>? middleLinkedListNode<T>(ListNode<T>? head) {
  ListNode<T>? slow = head;
  ListNode<T>? fast = head;
  while (fast != null && fast.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return slow;
}
