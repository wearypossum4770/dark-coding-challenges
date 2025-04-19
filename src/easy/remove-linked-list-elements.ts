import { ListNode } from "@/src/easy/list-node";

export const removeLinkedListElements = <T>(
    head: ListNode<T> | null,
    val: number,
): ListNode<T | null> | null => {
    const dummy: ListNode<T | null> = new ListNode<T | null>(
        null,
        head || undefined,
    );
    let current = dummy;
    while (current !== null && current.next !== null) {
        if (current.next.val === val) {
            current.next = current.next?.next;
        } else {
            current = current.next;
        }
    }
    return dummy?.next;
};
