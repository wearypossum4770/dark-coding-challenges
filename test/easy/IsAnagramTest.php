
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
    test("\n\tDetecting anagrams from a list", function (array $expected, string $word, array $candidates, string $criteria) {
        $instance = new IsAnagram;
        expect($instance->detectAnagram($word, $candidates))->toBe($expected);
    })->with([
        [
            ['gallery', 'regally', 'largely'], 'allergy',
            ['gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading'], 'detects three anagrams',
        ],
        [['inlets'], 'listen', ['enlists', 'google', 'inlets', 'banana'], 'detects anagram'],
        [[], 'good', ['dog', 'goody'], 'does not detect anagram subsets'],
        [
            ['lemons', 'melons'], 'solemn', ['lemons', 'cherry', 'melons'], 'detects two anagrams',
        ],
        [[], 'diaper', ['hello', 'world', 'zombies', 'pants'], 'no matches'],
        [['Eons', 'ONES'], 'nose', ['Eons', 'ONES'], 'detects multiple anagrams with different case'],
        [[], 'mass', ['last'], 'does not detect non-anagrams with identical checksum'],
        [
            ['Carthorse'], 'Orchestra', ['cashregister', 'Carthorse', 'radishes'],
            'detects anagrams case-insensitively',
        ],
        [
            ['carthorse'], 'Orchestra', ['cashregister', 'carthorse', 'radishes'],
            'detects anagrams using case-insensitive subject',
        ],
        [
            ['Carthorse'], 'orchestra', ['cashregister', 'Carthorse', 'radishes'],
            'detects anagrams using case-insensitive possible matches',
        ],
        [[], 'go', ['goGoGO'], 'does not detect an anagram if the original word is repeated'],
        [[], 'tapper', ['patter'], 'anagrams must use all letters exactly once'],
        [[], 'BANANA', ['BANANA'], 'words are not anagrams of themselves'],
        [
            [], 'BANANA', ['Banana'],
            'words are not anagrams of themselves even if letter case is partially different',
        ],
        [
            [], 'BANANA', ['banana'],
            'words are not anagrams of themselves even if letter case is completely different',
        ],
        [['Silent'], 'LISTEN', ['LISTEN', 'Silent'], 'words other than themselves can be anagrams'],
    ]);
});
