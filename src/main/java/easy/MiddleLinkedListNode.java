package easy;

public class MiddleLinkedListNode<T> {

  public DukeListNode<T> solve(DukeListNode<T> head) {
    DukeListNode<T> slow = head;
    DukeListNode<T> fast = head;
    while (fast != null && fast.next != null) {
      slow = slow.next;
      fast = fast.next.next;
    }
    return slow;
  }
}
