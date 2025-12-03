<?php

declare(strict_types=1);

namespace Src\Easy;

class ReverseLinkedList
{
 /**
     * @param ListNode|null $head
     * @return ListNode|null
     */
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
