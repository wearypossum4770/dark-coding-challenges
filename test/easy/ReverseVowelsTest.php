<?php

declare(strict_types=1);

use Src\Easy\ReverseVowels;

dataset('reverseVowelsData', [
    ['IceCreAm', 'AceCreIm'],
    ['leetcode', 'leotcede'],
    ['a', 'a'],
    ['b', 'b'],
    ['AEIOU', 'UOIEA'],
    ['aeiou', 'uoiea'],
    ['bcdfgh', 'bcdfgh'],
    ['aA', 'Aa'],
    ['a.b,e', 'e.b,a'],
    ['hello world', 'hollo werld'],
    ['aEiOu', 'uOiEa'],
    ['.,?!', '.,?!'],
    ['aaaaaa', 'aaaaaa'],
    ['aAaaAa', 'aAaaAa'],
]);
it('solve', function (string $word, string $expected) {
    $instance = new ReverseVowels;

    $result = $instance->solve($word);

    expect($result)->toBe($expected);

})->with('reverseVowelsData');
