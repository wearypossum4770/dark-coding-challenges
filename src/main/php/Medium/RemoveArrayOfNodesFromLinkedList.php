<?php

declare(strict_types=1);

namespace Src\Medium;

use Src\Helpers\ListNode;

/**
 * @param  int[]  $nums
 * @param  ListNode  $head
 * @return ListNode
 */
class RemoveArrayOfNodesFromLinkedList
{
    public function transformRemoveArrayOfNodesFromLinkedList(array $nums, ListNode $head): ListNode
    {
        $set = array_fill_keys($nums, true);

        $dummy = new ListNode(0, $head);
        $current = $dummy;
        while ($current !== null && $current->next !== null) {
            if (isset($set[$current->next->val])) {
                $current->next = $current->next->next;
            } else {
                $current = $current->next;
            }
        }

        return $dummy->next;
    }

    public function solve(array $nums, ListNode $head): ListNode
    {
        return $this->transformRemoveArrayOfNodesFromLinkedList($nums, $head);
    }
}
