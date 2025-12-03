<?php

declare(strict_types=1);

namespace Src\Easy;

class ReverseLinkedList
{
    public function solve(?ListNode $head): ?ListNode
    {
        $previous = null;
        $current = $head;
        while ($current !== null) {
            $next = $current->next;
            $current->next = $previous;
            $previous = $current;
            $current = $next;
        }

        return $previous;
    }
}
