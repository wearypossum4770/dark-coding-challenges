<?php

declare(strict_types=1);

use Src\Easy\CanConstructRansomNote;

dataset('canConstructRansomNoteData', [
    ['a', 'b', false],
    ['aa', 'aab', true],
    ['a', 'a', true],
    ['aa', 'ab', false],
    ['abc', 'cbad', true],
    ['', 'anything', true],
    ['a', '', false],
    ['', '', true],
    ['aA', 'aa', true],
    ['Aa', 'aA', true],
    ['zzz', 'zzzzzz', true],
    ['zzzz', 'zzz', false],
    ['hello world', 'dlrow olleh', true],
]);
it('solve', function (string $note, string $magazine, bool $expected) {
    $instance = new CanConstructRansomNote;

    $result = $instance->solve($note, $magazine);

    expect($result)->toBe($expected);

})->with('canConstructRansomNoteData');
