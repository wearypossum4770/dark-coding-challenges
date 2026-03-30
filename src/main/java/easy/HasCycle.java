package easy;

public class HasCycle<T> {
  public boolean solve(DukeListNode<T> head) {
    var fast = head;
    var slow = head;
    while (fast != null && fast.next != null) {
      fast = fast.next.next;
      slow = slow.next;
      if (fast != null && fast.equals(slow)) return true;
    }
    return false;
  }
}
