<?php

declare(strict_types=1);

use Src\Easy\ListNode;
use Src\Easy\ReverseLinkedList;

dataset('reverseLinkedListData', [
    [[1, 2, 3, 4, 5], [5, 4, 3, 2, 1]],
    [[1, 2], [2, 1]],
    [[], []],
]);
describe('\n\tFeature: Reverse Linked List', function () {

    test("\n\tGiven: a linked list :candidate.\n\tWhen: it is reversed.\n\tThen: it will be :expected.", function ($candidate, $expected) {
        $instance = new ReverseLinkedList;
        $head = ListNode::fromArray($candidate);
        $result = $instance->solve($head);
        $target = ListNode::toArray($result);
        expect($target)->toBe($expected);

    })->with('reverseLinkedListData');

});
