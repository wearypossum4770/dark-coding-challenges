import { ListNode } from "../easy/list-node";
export const removeArrayOfNodesFromLinkedList = (
    nums: number[],
    head: ListNode<number> | null,
): ListNode<number> | null => {
    const unique = new Set<number | null>(nums);
    const dummy = new ListNode<number>(null, head || undefined);
    let current = dummy;
    while (current.next) {
        if (unique.has(current?.next?.val)) {
            current.next = current.next.next;
        } else {
            current = current.next;
        }
    }
    return dummy.next;
};
