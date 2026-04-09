<?php

declare(strict_types=1);

use Src\Medium\ReverseWordsInString;

dataset('reverseWordsInStringData', [
    'basic four word sentence' => ['the sky is blue', 'blue is sky the'],
    'leading and trailing spaces' => ['  hello world  ', 'world hello'],
    'multiple spaces between words' => ['a good   example', 'example good a'],
    'single character' => ['a', 'a'],
    'single character with leading space' => [' a', 'a'],
    'single character with trailing space' => ['a ', 'a'],
    'single character with both spaces' => [' a ', 'a'],
    'single character with multiple surrounding spaces' => ['  a  ', 'a'],
    'two words no extra spaces' => ['hello world', 'world hello'],
    'five words no extra spaces' => ['one two three four five', 'five four three two one'],
    'multiple spaces throughout with surrounding spaces' => ['  spaces   between   words  ', 'words between spaces'],
    'single word no spaces' => ['word', 'word'],
    'single word with surrounding spaces' => ['  word  ', 'word'],
    'two single chars' => ['a b', 'b a'],
    'two single chars double space' => ['a  b', 'b a'],
    'three single chars triple spaced' => ['a   b   c', 'c b a'],
    'mixed case two words' => ['Hello World', 'World Hello'],
    'all uppercase two words' => ['UPPER LOWER', 'LOWER UPPER'],
    'camel and pascal case words' => ['camelCase pascalCase', 'pascalCase camelCase'],
    'alphanumeric words' => ['abc123 456def', '456def abc123'],
    'three alphanumeric words' => ['foo1 bar2 baz3', 'baz3 bar2 foo1'],
    'alphanumeric with interleaved digits' => ['a1b2c3 d4e5f6 g7h8i9', 'g7h8i9 d4e5f6 a1b2c3'],
    'pure numeric words' => ['123 456 789', '789 456 123'],
    'single digit' => ['1', '1'],
    'single digit with surrounding spaces' => [' 1 ', '1'],
    'three digits double spaced with surrounding spaces' => ['  1  2  3  ', '3 2 1'],
    'four words triple spaced' => ['the   sky   is   blue', 'blue is sky the'],
    'five names single spaced' => ['Alice Bob Charlie Dave Eve', 'Eve Dave Charlie Bob Alice'],
    'ten words single spaced' => ['foo bar baz qux quux corge grault garply waldo fred', 'fred waldo garply grault corge quux qux baz bar foo'],
    'only leading spaces' => ['  leading', 'leading'],
    'only trailing spaces' => ['trailing  ', 'trailing'],
    'single word both sides padded' => ['  both  ', 'both'],
    'five single chars double spaced' => ['a  b  c  d  e', 'e d c b a'],
    'ten two char words single spaced' => ['ab cd ef gh ij kl mn op qr st', 'st qr op mn kl ij gh ef cd ab'],
    'mixed case three words' => ['MixED cAsE wOrDs', 'wOrDs cAsE MixED'],
    'single letter x' => ['x', 'x'],
    'single letter x with surrounding spaces' => [' x ', 'x'],
    'two single letters' => ['x y', 'y x'],
    'two single letters extra spaces' => [' x  y ', 'y x'],
    'three single letters single spaced' => ['a b c', 'c b a'],
    'three single letters extra spaces with padding' => [' a  b  c ', 'c b a'],
    'three words triple spaced' => ['word1   word2   word3', 'word3 word2 word1'],
    'three words triple spaced with surrounding spaces' => ['  first   second   third  ', 'third second first'],
    'four mixed case two char words' => ['aA bB cC dD', 'dD cC bB aA'],
    'full alphabet reversed single spaced' => ['z y x w v u t s r q p o n m l k j i h g f e d c b a', 'a b c d e f g h i j k l m n o p q r s t u v w x y z'],
    'long string with erratic spacing' => [' gtUGyw       sQ       ZaYYygdFe    Rep6lU  o z      QcspISw       k0b9Ts   KkkRVXY7   OUVxX1zsUL      aQ7iiTy      nKCtoS8       Jp  15uAqvNl   W9Mqf7cep    c      WZJ0M3Z       kX       J     en       wUb6 yY     9v      6eq hQs UmNRei   qEjVjL      xmhQMptz   kT     VBLWqIJXRi       qM      L3jQ78    p    TZH     glfOAYah40   GsaSwLnOs     zIiIXd     YgHsUKFd     i7      0       11lASBGl   LKg3a    LDtzIOvWLt   vPKksW Aa  LFTT      M6FyWJ  y5j02N      lKw sBmxVa1Eh     eLl uM2P  q4    7W8r   GV9    KipYyS0 S pA', 'pA S KipYyS0 GV9 7W8r q4 uM2P eLl sBmxVa1Eh lKw y5j02N M6FyWJ LFTT Aa vPKksW LDtzIOvWLt LKg3a 11lASBGl 0 i7 YgHsUKFd zIiIXd GsaSwLnOs glfOAYah40 TZH p L3jQ78 qM VBLWqIJXRi kT xmhQMptz qEjVjL UmNRei hQs 6eq 9v yY wUb6 en J kX WZJ0M3Z c W9Mqf7cep 15uAqvNl Jp nKCtoS8 aQ7iiTy OUVxX1zsUL KkkRVXY7 k0b9Ts QcspISw z o Rep6lU ZaYYygdFe sQ gtUGyw'],
]);
it('Reverse Words in a String', function (string $s, string $expected) {
    $instance = new ReverseWordsInString;

    $result = $instance->solve($s);

    expect($result)->toBe($expected);

})->with('reverseWordsInStringData');
