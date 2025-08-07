
<?php

use Src\Easy\IsAnagram;

describe('\n\tFeature: Anagram detection', function () {

    test('Testing', function (string $s, string $t, bool $expected) {
        $instance = new IsAnagram;

        expect($instance->solve($s, $t))->toBe($expected);

    })->with([
        ['listen', 'silent', true],
        ['evil', 'vile', true],
        ['race', 'care', true],
        ['anagram', 'nagaram', true],
        ['listen', 'silent', true],
        ['triangle', 'integral', true],
        ['apple', 'pale', false],
        ['aacc', 'ccac', false],
        ['', '', true],
        ['a', 'a', true],
        ['a', 'b', false],
        ['aaaaa', 'aaaaa', true],
        ['abcd', 'abdc', true],
    ]);
});
