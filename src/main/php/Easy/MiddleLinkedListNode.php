<?php

declare(strict_types=1);

namespace Src\Easy;

/**
 * @template T
 */
class MiddleLinkedListNode
{
    /**
     * Find the middle node of a linked list using the two-pointer technique.
     *
     * @param  ListNode<T>|null  $head  The head of the linked list.
     * @return ListNode<T>|null The middle node of the linked list.
     */
    public function transformMiddleLinkedListNode(?ListNode $head): ?ListNode
    {
        if ($head === null) {
            return null;
        }
        $fast = $head;
        $slow = $head;
        while ($fast !== null && $fast->next !== null) {
            $fast = $fast->next->next;
            $slow = $slow->next;
        }

        return $slow;
    }

    /**
     * Wrapper method for transforming the linked list.
     *
     * @param  ListNode<T>|null  $head  The head of the linked list.
     * @return ListNode<T>|null The middle node.
     */
    public function solve(?ListNode $head): ?ListNode
    {
        return $this->transformMiddleLinkedListNode($head);
    }
}
