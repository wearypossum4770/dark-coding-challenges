<?php

declare(strict_types=1);

namespace Src\Easy;

class GetArrayConcatenation
{
    /**
     * @param  int[]  $nums
     * @return int[]
     */
    public function solve(array $nums): array
    {
        $result = array_fill(0, 2 * count($nums), 0);
        foreach ($nums as $key => $value) {
            $result[$key] = $value;
            $result[$key + count($nums)] = $value;
        }

        return $result;
    }
}
