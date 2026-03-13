<?php

declare(strict_types=1);

namespace Src\Easy;

class FindLargestAltitude
{
    /**
     * @param  int[]  $gain
     */
    public function solve(array $gain): int
    {
        $result = array_fill(0, count($gain) + 1, 0);
        $altitude = 0;
        for ($i = 0; $i < count($gain); $i++) {
            $altitude += $gain[$i];
            $result[$i] = $altitude;
        }

        return max($result);
    }
}
