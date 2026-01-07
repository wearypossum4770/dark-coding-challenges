<?php

declare(strict_types=1);

use Src\Helpers\ListNode;
use Src\Medium\DeleteLinkedListNode;

dataset('deleteLinkedListNodeData', [
    [[4, 5, 1, 9], 5, [4, 1, 9]],
    [[4, 5, 1, 9], 1, [4, 5, 9]],
    [[1, 2, 3, 4], 3, [1, 2, 4]],
    [[0, 1], 0, [1]],
]);
it('solve', function (array $nums, int $node, array $expected) {
    $list = ListNode::fromArray($nums);
    $nodeToDelete = $list;
    while ($nodeToDelete !== null) {
        if ($nodeToDelete->val === $node) {
            break;
        }
        $nodeToDelete = $nodeToDelete->next;
    }

    $instance = new DeleteLinkedListNode;

    $instance->solve($nodeToDelete);
    $result = ListNode::toArray($list);

    expect($result)->toBe($expected);

})->with('deleteLinkedListNodeData');
