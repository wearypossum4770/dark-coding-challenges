<?php

declare(strict_types=1);

use Src\Medium\TopFrequentWords;

dataset('topFrequentWordsData', [
    [['i', 'love', 'leetcode', 'i', 'love', 'coding'], 2, ['i', 'love']],
    [['i', 'love', 'leetcode', 'i', 'love', 'coding'], 3, ['i', 'love', 'coding']],
    [['the', 'day', 'is', 'sunny', 'the', 'the', 'the', 'sunny', 'is', 'is'], 4, ['the', 'is', 'sunny', 'day']],
    [['hello', 'hello', 'hello'], 1, ['hello']],
    [['a', 'b', 'c', 'd'], 4, ['a', 'b', 'c', 'd']],
    [['apple', 'banana', 'apple', 'banana', 'cherry', 'cherry'], 3, ['apple', 'banana', 'cherry']],
    [['x', 'y', 'z'], 1, ['x']],
    [[], 0, []],
    [['a', 'aa', 'aaa', 'a', 'aaa', 'aaa', 'aa', 'b', 'b', 'b'], 3, ['aaa', 'b', 'a']],
    [['one', 'two'], 2, ['one', 'two']],

]);
it('solve', function (array $words, int $k, array $expected) {
    $instance = new TopFrequentWords;

    $result = $instance->solve($words, $k);

    expect($result)->toBe($expected);

})->with('topFrequentWordsData');
