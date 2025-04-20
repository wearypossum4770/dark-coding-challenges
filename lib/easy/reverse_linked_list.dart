import 'package:dark_coding_challenges/easy/list_node.dart';

/// Reverses a singly linked list.
///
/// Takes the head of the linked list and returns the new head after reversal.
ListNode<T>? reverseLinkedList<T>(ListNode<T>? head) {
  ListNode<T>? next;
  ListNode<T>? previous;
  ListNode<T>? current = head;

  while (current != null) {
    next = current.next;
    current.next = previous;
    previous = current;
    current = next;
  }

  return previous;
}
