import { describe, test, expect } from "bun:test";
import { reverseLinkedList } from "@/src/easy/reverse-linked-list";
import { ListNode } from "@/src/easy/list-node";
describe("reverseLinkedList", () => {
    test.each([
        [
            [1, 2, 3, 4, 5],
            [5, 4, 3, 2, 1],
        ],
        [
            [1, 2],
            [2, 1],
        ],
        [[], []],
    ])(
        "\n\tGiven a linked list %p.\n\tWhen: reversed",
        (nums: number[], output: number[]) => {
            expect(Array.isArray(nums)).toBe(true);
            expect(Array.isArray(output)).toBe(true);

            const head = ListNode.fromArray(nums);
            const result = reverseLinkedList(head);
            const outcome = ListNode.toArray(result);
            console.log({ outcome });
            expect(outcome).toStrictEqual(output);
        },
    );
});
