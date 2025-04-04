
<?php

use Src\Easy\ReverseString;

describe('TestValue', function () {

    test('Testing', function ($candidate, $expected) {
        $instance = new ReverseString;
        $instance->solve($candidate);
        expect($candidate)->toBe($expected);

    })->with([
        [['h', 'e', 'l', 'l', 'o'], ['o', 'l', 'l', 'e', 'h']],
        [['a', 'b', 'c', 'd'], ['d', 'c', 'b', 'a']],
        [['z'], ['z']],
        [[], []],
    ]);

});
