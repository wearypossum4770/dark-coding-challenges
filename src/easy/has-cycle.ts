import type { ListNode } from "./list-node";

export const hasCycle = <T>(head: ListNode<T> | null): boolean => {
	let slow = head;
	let fast = head;
	while (fast !== null && fast.next !== null && slow !== null) {
		slow = slow?.next ?? null;
		fast = fast.next.next;
		if (slow === fast) return true;
	}

	return false;
};
