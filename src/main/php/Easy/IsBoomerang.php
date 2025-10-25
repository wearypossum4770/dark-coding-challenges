<?php

declare(strict_types=1);

namespace Src\Easy;

class IsBoomerang
{
    /**
     * @param  int[][]  $points
     */
    public function transformIsBoomerang(array $points): bool
    {
        $distinct = [];
        foreach ($points as [$x, $y]) {
            $key = "{$x},{$y}";
            if (isset($distinct[$key])) {
                return false;
            }
            $distinct[$key] = true;
        }
        if (count($distinct) !== 3) {
            return false;
        }
        [$x1, $y1] = $points[0];
        [$x2, $y2] = $points[1];
        [$x3, $y3] = $points[2];
        $area = abs($x1 * ($y2 - $y3) + $x2 * ($y3 - $y1) + $x3 * ($y1 - $y2));

        return $area !== 0;
    }

    public function solve(array $points): bool
    {
        return $this->transformIsBoomerang($points);
    }
}
