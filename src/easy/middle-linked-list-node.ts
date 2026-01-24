import { ListNode } from "./list-node";
export const middleLinkedListNode = <T>(
	head: ListNode<T> | null,
): ListNode<T> | null => {
	let slow = head;
	let fast = head;
	while (fast != null && fast.next != null) {
		slow = slow?.next ?? null;
		fast = fast.next.next;
	}

	return slow;
};
