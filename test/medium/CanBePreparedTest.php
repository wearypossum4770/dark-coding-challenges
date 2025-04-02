
<?php

use Src\Medium\CanBePrepared;

describe('TestValue', function () {

    test('Testing', function ($recipe, $ingredients, $expected) {
        $instance = new CanBePrepared;

        expect($instance->solve($recipe, $ingredients))->toBe($expected);

    })->with([
        ['', [], false],
        ['O', ['O'], true],
        ['B|O', ['O'], true],
        ['O|B', ['O'], true],
        ['B|O', ['O', 'B'], true],
        ['B', ['O'], false],
        ['(O&M)', ['O'], false],
        ['(M&O)', ['O'], false],
        ['(O|B)', ['O', 'B'], true],
        ['(M&F)', ['M', 'F'], true],
        ['(M&F)', ['M', 'E'], false],
        ['(B|O|L)', ['B', 'M', 'F'], true],
        ['(B&M&S&F)', ['B', 'M', 'F', 'S'], true],
        ['(E|(M&F))', ['M', 'E'], true],
        ['(E|(M&F))', ['M', 'B'], false],
        ['( M & F )', ['M', 'F'], true],
        ['(E|(M&F))', ['M', 'F'], true],
        ['(M&(F&G))', ['M', 'F', 'G'], true],
        ['(M&(F&G))', [], false],
        // ['(M&(F&E))', ['M', 'F', 'G'], false],
        // // test cases provided by Chat GPT
        ['((A&B)|C)', ['A', 'B'], true],
        ['((A&B)|C)', ['C'], true],
        ['((A&B)|C)', ['A'], false],
        ['(A&(B|C))', ['A', 'B'], true],
        ['(A&(B|C))', ['A', 'C'], true],
        // ['(A&(B|C))', ['A'], false],
        ['((A&B)&C)', ['A', 'B', 'C'], true],
        ['(A&B)|(C&D)', ['A'], false],
        ['((A&B)&C)', ['A', 'B'], false],
        ['((A|B)&(C|D))', ['A', 'C'], true],
        ['((A|B)&(C|D))', ['B', 'D'], true],
        // ['((A|B)&(C|D))', ['A'], false],
        ['((((A&B)|C)&D)|E)', ['E'], true],
        ['((((A&B)|C)&D)|E)', ['A', 'B', 'D'], true],
        // ["((((A&B)|C)&D)|E)", ['A', 'B'], false],
    ]);

});
