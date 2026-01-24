<?php

declare(strict_types=1);

use Src\Easy\ListNode;
use Src\Easy\MiddleLinkedListNode;

set_time_limit(5); // 5 seconds

dataset('middleLinkedListNodeData', [
    'empty list' => [[], []],
    'single element' => [[1], [1]],
    'even number of elements' => [[1, 2, 3, 4], [3, 4]],
    'odd number of elements' => [[1, 2, 3, 4, 5], [3, 4, 5]],
    'long list' => [[1, 2, 3, 4, 5, 6, 7, 8, 9], [5, 6, 7, 8, 9]],
]);
/**
 * @test
 *
 * @timeout 5
 */
it('solve', function (array $input, array $output) {

    $head = ListNode::fromArray($input);
    $instance = new MiddleLinkedListNode;

    $result = $instance->solve($head);
    $outcome = ListNode::toArray($result);
    expect($outcome)->toBe($output);

})->with('middleLinkedListNodeData');
