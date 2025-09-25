import { ListNode } from '../easy/list-node'
export const deleteLinkedListNode = <T>(node: ListNode<T>| null): void => {
	if(!node) return;
	Object.assign(node, node.next)

}