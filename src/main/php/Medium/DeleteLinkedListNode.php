<?php

declare(strict_types=1);

namespace Src\Medium;

use Src\Helpers\ListNode;

class DeleteLinkedListNode
{
    public function transformDeleteLinkedListNode(ListNode &$node)
    {
        $node->val = $node->next->val;
        $node->next = $node->next->next;
    }

    public function solve(ListNode &$node)
    {
        $this->transformDeleteLinkedListNode($node);
    }
}
