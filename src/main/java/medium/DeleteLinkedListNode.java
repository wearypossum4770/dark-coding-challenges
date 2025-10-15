package medium;

import easy.DukeListNode;

public class DeleteLinkedListNode {
  public void solve(DukeListNode node) {
    node.val = node.next.val;
    node.next = node.next.next;
  }
}
