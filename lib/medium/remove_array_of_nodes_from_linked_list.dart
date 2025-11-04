import 'package:dark_coding_challenges/easy/list_node.dart';

ListNode<int>? removeArrayOfNodesFromLinkedList(List<int> nums, ListNode<int>? head) {
  final unique = nums.toSet();
  ListNode<int>? dummy = ListNode(0, head);
  ListNode<int>? current = dummy;
  while (current != null && current.next != null) {
    if (unique.contains(current.next?.val)) {
      current.next = current.next?.next;
    } else {
      current = current.next;
    }
  }
  return dummy.next;
}
