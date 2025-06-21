<?php	declare(strict_types=1);

use Src\Medium\MaximumManhattanDistance;


    dataset("maximumManhattanDistanceData", []);
it('solve', function (int $n, int $expected) {
$instance = new MaximumManhattanDistance();

$result = $instance->solve($n);

expect($result)->toBe($expected);

})->with('maximumManhattanDistanceData');