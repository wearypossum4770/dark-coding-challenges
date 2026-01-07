import { describe, test, expect } from "bun:test";
import { deleteLinkedListNode } from "@/src/medium/delete-linked-list-node";
import { ListNode } from "@/src/easy/list-node";
describe("deleteLinkedListNode", () => {
	test.each([
		[[4, 5, 1, 9], 5, [4, 1, 9]],
		[[4, 5, 1, 9], 1, [4, 5, 9]],
		[[1, 2, 3, 4], 3, [1, 2, 4]],
		[[0, 1], 0, [1]],
	])("", (inputs: number[], target: number, output: number[]) => {
		const head = ListNode.fromArray(inputs);
		let node = head;
		while (node != null) {
			if (node.val === target) break;
			node = node.next;
		}
		deleteLinkedListNode(node);
		const result = ListNode.toArray(head);
		expect(result).toStrictEqual(output);
	});
});
