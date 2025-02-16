<?php

use Src\Easy\FizzBuzz;

use function Src\Easy\integerToFizzBuzz;

describe('Feature: FizzBuzz Challenge', function () {
    describe("\n\tScenario Outline: Convert number to FizzBuzz\n\tGiven a positive integer\n\tWhen converted to its FizzBuzz representation", function () {
        test('\n\t\tCount by FizzBuzz', function ($candidate, $expected) {
            $instance = new FizzBuzz;

            expect($instance->solve($candidate))->toBe($expected);
        })->with([
            'transform 5 to FizzBuzz array' => [5,
                // @codingStandardsIgnoreStart
                ['1', '2', 'Fizz', '4', 'Buzz'],
                // @codingStandardsIgnoreEnd
            ],
            'transform 3 to FizzBuzz array' => [3,
                // @codingStandardsIgnoreStart
                ['1', '2', 'Fizz'],
                // @codingStandardsIgnoreEnd
            ],
            'transform 16 to FizzBuzz array' => [16,
                // @codingStandardsIgnoreStart
                ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz', '16'],
                // @codingStandardsIgnoreEnd
            ],
            'transform 15 to FizzBuzz array' => [15,
                // @codingStandardsIgnoreStart
                ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz'],
                // @codingStandardsIgnoreEnd
            ],
            'transform 35 to FizzBuzz array' => [35,
                // @codingStandardsIgnoreStart
                ['1', '2', 'Fizz', '4', 'Buzz', 'Fizz', '7', '8', 'Fizz', 'Buzz', '11', 'Fizz', '13', '14', 'FizzBuzz', '16', '17', 'Fizz', '19', 'Buzz', 'Fizz', '22', '23', 'Fizz', 'Buzz', '26', 'Fizz', '28', '29', 'FizzBuzz', '31', '32', 'Fizz', '34', 'Buzz'],
                // @codingStandardsIgnoreEnd
            ],
        ]);
        test("\n\tThen it should successfully convert the the value", function ($candidate, $expected) {
            $instance = new FizzBuzz;

            expect(integerToFizzBuzz($candidate))->toBe($expected);
        })->with([
            'Fizz' => [3, 'Fizz'],
            'Buzz' => [5, 'Buzz'],
            'FizzBuzz' => [15, 'FizzBuzz'],
            'Number' => [7, '7'],
        ]);
    });
});
