package easy;

/**
 * A class that provides a method to remove all elements with a specified value from a singly linked
 * list.
 *
 * @param <T> The type of the elements in the linked list.
 */
public class RemoveLinkedListElements<T> {

  /**
   * Removes all nodes in the linked list that have the specified value.
   *
   * @param head The head node of the linked list.
   * @param val The value to remove from the linked list.
   * @return The head of the modified linked list, or null if the list is empty after removal.
   */
  public DukeListNode<T> solve(DukeListNode<T> head, T val) {
    if (head == null) {
      return null; // Return null if the list is empty
    }

    DukeListNode<T> dummy = new DukeListNode<>();
    dummy.next = head;
    DukeListNode<T> current = dummy;

    while (current.next != null) {
      if (current.next.val.equals(val)) {

        current.next = current.next.next;
      } else {

        current = current.next;
      }
    }

    return dummy.next;
  }
}
