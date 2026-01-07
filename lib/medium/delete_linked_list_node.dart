import 'package:dark_coding_challenges/easy/list_node.dart';

void deleteLinkedListNode<T>(ListNode<T>? node) {
  if (node == null) return;
  node.val = node.next?.val;
  node.next = node.next?.next;
}
