
<?php

use Src\Easy\ReverseLinkedList;

describe('TestValue', function () {

    test('Testing', function ($candidate, $expected) {
        $instance = new ReverseLinkedList;

        expect($instance->solve($candidate))->toBe($expected);

    })->with([]);

});
