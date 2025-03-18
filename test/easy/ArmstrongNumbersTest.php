
<?php

use Src\Easy\ArmstrongNumbers;

describe('Feature: Armstrong Number', function () {
    test('Scenario: Check if a number is an Armstrong Number', function ($candidate, $expected) {
        $instance = new ArmstrongNumbers;
        expect($instance->solve($candidate))->toBe($expected);
    })->with([
        [2, 1],
        [89, 0],
        [0, 1],
        [39, 0],
        [555, 0],
        [9475, 0],
        [9926315, 1],
        [93084, 1],
        [548834, 1],
        [2147483647, 0],
        [365, 0],
        [120, 0],
        [1253, 0],
        [153, 1],
        [-153, 0],
        [407, 1],
        [370, 1],
        [371, 1],
        [1634, 1],
        [8208, 1],
        [9474, 1],

    ]);
});
