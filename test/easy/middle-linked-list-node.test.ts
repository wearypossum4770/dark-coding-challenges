import { describe, test, expect } from "bun:test";
import { middleLinkedListNode } from "@/src/easy/middle-linked-list-node";
import { ListNode } from "@/src/easy/list-node";
describe("\n\tFeature: Slice Linked List in half.", () => {
	test.each([
		[[], []],
		[[Number.MAX_VALUE], [Number.MAX_VALUE]],
		[[Number.MAX_VALUE, Number.MAX_VALUE], [Number.MAX_VALUE]],
		[
			[1, 1, 1, 1, 1],
			[1, 1, 1],
		],
		[
			[-3, -2, -1, 0, 1, 2, 3],
			[0, 1, 2, 3],
		],
		[[1], [1]],
		[[1, 2], [2]],
		[
			[1, 2, 3],
			[2, 3],
		],
		[
			[1, 2, 3, 4],
			[3, 4],
		],
		[
			[1, 2, 3, 4, 5],
			[3, 4, 5],
		],
		[
			[1, 2, 3, 4, 5, 6],
			[4, 5, 6],
		],
	])("\n\tGiven: the linked list %p.\n\tWhen: sliced in half.\n\tThen: it is %p", (inputs: number[], expected: number[]) => {
		const head = ListNode.fromArray(inputs);
		const result = middleLinkedListNode(head);
		const outcome = ListNode.toArray(result);
		expect(outcome).toStrictEqual(expected);
	});
});
